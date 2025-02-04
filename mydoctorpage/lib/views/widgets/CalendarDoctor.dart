import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalendarDoctor extends StatefulWidget {
  @override
  _CalendarDoctorState createState() => _CalendarDoctorState();
}

class _CalendarDoctorState extends State<CalendarDoctor> {
  List<DateTime> _timeSlots = [];
  Set<DateTime> _busySlots = {}; // Tracks busy slots
  DateTime? _selectedDate;
  final int doctorId = 14; // Replace with the doctor's ID from the database

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Calendar widget
        SfCalendar(
          view: CalendarView.month,
          monthViewSettings: MonthViewSettings(),
          onTap: (details) async {
            if (details.date != null) {
              setState(() {
                _selectedDate = details.date;
                _timeSlots = _generateTimeSlots(details.date!);
              });
              await _fetchBusySlots(); // Fetch busy slots after selecting a date
            }
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
              crossAxisCount: 7,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: _timeSlots.length,
            itemBuilder: (context, index) {
              final time = _timeSlots[index];
              final isBusy = _busySlots.contains(time);
              return GestureDetector(
                onTap: () => _showConfirmationDialog(time, isBusy),
                child: Card(
                  color: isBusy ? Colors.grey : Colors.blue.shade100,
                  child: Center(
                    child: Text(
                      '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isBusy ? Colors.white : Colors.black,
                      ),
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

  // Generate time slots for the day (from 9:00 AM to 4:00 PM)
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

  // Fetch busy slots from the backend
  Future<void> _fetchBusySlots() async {
    if (_selectedDate == null) return;

    final dateStr = _selectedDate!.toIso8601String().split('T')[0]; // 'yyyy-mm-dd'
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

            setState(() {
                _busySlots = busySlots;
            });
        } else {
            throw Exception('Failed to load busy slots');
        }
    } catch (error) {
        print("Error fetching busy slots: $error");
    }
}


  // Show confirmation dialog to ask the doctor before toggling slot status
  Future<void> _showConfirmationDialog(DateTime time, bool isBusy) async {
    final action = isBusy ? 'make this slot available' : 'mark this slot as busy';
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Slot Status'),
        content: Text('Do you want to $action?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Confirm'),
          ),
        ],
      ),
    );

    if (result == true) {
      _toggleSlotStatus(time);
    }
  }

  // Toggle slot status (add/remove) and update backend
  Future<void> _toggleSlotStatus(DateTime time) async {
    final dateStr = _selectedDate!.toIso8601String().split('T')[0]; // 'yyyy-mm-dd'
    final action = _busySlots.contains(time) ? 'remove' : 'add';
    final slot = '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    final url = Uri.parse(
      'http://localhost:5000/timeslots?doctorid=$doctorId&date=$dateStr&slot=$slot&action=$action',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success']) {
          setState(() {
            if (action == 'add') {
              _busySlots.add(time);
            } else {
              _busySlots.remove(time);
            }
          });
        } else {
          throw Exception('Failed to update busy slot');
        }
      } else {
        throw Exception('Failed to update busy slot');
      }
    } catch (error) {
      print("Error updating busy slot: $error");
    }
  }
}
