import 'package:equatable/equatable.dart';

abstract class SignupPatientState extends Equatable {
  const SignupPatientState();

  @override
  List<Object?> get props => [];
}

class SignupPatientInitial extends SignupPatientState {}

class SignupPatientLoading extends SignupPatientState {}

class SignupPatientSuccess extends SignupPatientState {}

class SignupPatientFailure extends SignupPatientState {
  final String error;

  const SignupPatientFailure(this.error);

  @override
  List<Object?> get props => [error];
}
