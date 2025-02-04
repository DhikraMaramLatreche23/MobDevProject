import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalendarPatient extends StatefulWidget {
  @override
  _CalendarPatientState createState() => _CalendarPatientState();
}

class _CalendarPatientState extends State<CalendarPatient> {
  List<DateTime> _timeSlots = [];
  Set<DateTime> _busySlots = {};
  DateTime? _selectedDate;
  final int doctorId = 14; // Replace with the doctor's ID from the database
  bool _isFetching = false; // Flag to track if we are fetching busy slots

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCalendar(
          view: CalendarView.month,
          monthViewSettings: MonthViewSettings(),
          onTap: (details) async {
            if (_isFetching || details.date == null) return; // Avoid fetching if already fetching

            setState(() {
              _selectedDate = details.date;
              _timeSlots = _generateTimeSlots(details.date!);
              _isFetching = true; // Set flag to true while fetching
            });

            await _fetchBusySlots();

            setState(() {
              _isFetching = false; // Reset flag after fetching
            });
          },
        ),
        if (_selectedDate != null) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Available Time Slots for ${_selectedDate!.toLocal().toString().split(' ')[0]}:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: _timeSlots.where((slot) => !_busySlots.contains(slot)).length,
            itemBuilder: (context, index) {
              final availableSlots =
                  _timeSlots.where((slot) => !_busySlots.contains(slot)).toList();
              final time = availableSlots[index];
              return GestureDetector(
                onTap: () => _showBookingDialog(time),
                child: Card(
                  color: Colors.green.shade100,
                  child: Center(
                    child: Text(
                      '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              );
            },
          ),
        ] else
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Select a date to view available time slots',
              style: TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }

  List<DateTime> _generateTimeSlots(DateTime date) {
    final List<DateTime> slots = [];
    DateTime start = DateTime(date.year, date.month, date.day, 9, 0);
    DateTime end = DateTime(date.year, date.month, date.day, 16, 0);
    while (start.isBefore(end)) {
      slots.add(start);
      start = start.add(Duration(minutes: 30));
    }
    return slots;
  }

  Future<void> _fetchBusySlots() async {
    if (_selectedDate == null) return;

    final dateStr = _selectedDate!.toIso8601String().split('T')[0];
    final url = Uri.parse('http://localhost:5000/timeslots?doctorid=$doctorId&date=$dateStr');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> busy = data['busyslots'] ?? [];
        final Set<DateTime> busySlots = {};

        for (var slot in busy) {
          final timeParts = slot.split(':');
          final busyDate = DateTime(
            _selectedDate!.year,
            _selectedDate!.month,
            _selectedDate!.day,
            int.parse(timeParts[0]),
            int.parse(timeParts[1]),
          );
          busySlots.add(busyDate);
        }

        if (mounted) { // Ensuring the widget is still mounted before calling setState
          setState(() {
            _busySlots = busySlots;
          });
        }
      } else {
        throw Exception('Failed to load busy slots');
      }
    } catch (error) {
      print("Error fetching busy slots: $error");
    }
  }

  Future<void> _showBookingDialog(DateTime time) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Appointment'),
        content: Text(
          'Do you want to book an appointment at ${time.hour}:${time.minute.toString().padLeft(2, '0')}?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('Cancel')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text('Confirm')),
        ],
      ),
    );

    if (result == true) {
      await _bookAppointment(time);
    }
  }

  Future<void> _bookAppointment(DateTime time) async {
    final dateStr = _selectedDate!.toIso8601String().split('T')[0];
    final slot = '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    final url = Uri.parse('http://localhost:5000/book_appointment');
    final payload = json.encode({
      'patientid': 1, // Replace with actual patient ID
      'doctorid': doctorId,
      'date': dateStr,
      'slot': slot,
    });

    try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: payload);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success']) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Appointment booked successfully.')),
          );
        } else {
          throw Exception(data['message']);
        }
      } else {
        throw Exception('Failed to book appointment');
      }
    } catch (error) {
      print("Error booking appointment: $error");
    }
  }
}
