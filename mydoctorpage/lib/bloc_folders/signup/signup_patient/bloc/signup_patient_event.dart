import 'package:equatable/equatable.dart';

abstract class SignupPatientEvent extends Equatable {
  const SignupPatientEvent();

  @override
  List<Object?> get props => [];
}

class SignupPatientPageSubmitted extends SignupPatientEvent {
  final String name;
  final String surname;
  final String email;
  final String password;

  const SignupPatientPageSubmitted({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, surname, email, password];
}
