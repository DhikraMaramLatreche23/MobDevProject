import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// States
abstract class SignupState extends Equatable {
  const SignupState();
  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String error;
  const SignupFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// Events
abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object?> get props => [];
}

class SignupDoctorPageOneSubmitted extends SignupEvent {
  final String name;
  final String surname;
  final String email;
  final String password;

  const SignupDoctorPageOneSubmitted({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, surname, email, password];
}

class SignupDoctorPageTwoSubmitted extends SignupEvent {
  final String speciality;
  final String address;
  final String phone;
  final String description;

  const SignupDoctorPageTwoSubmitted({
    required this.speciality,
    required this.address,
    required this.phone,
    required this.description,
  });

  @override
  List<Object?> get props => [speciality, address, phone, description];
}

// BLoC
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupDoctorPageOneSubmitted>((event, emit) {
      emit(SignupLoading());

      // Validate or save data from Page 1
      Future.delayed(const Duration(seconds: 1), () {
        emit(SignupInitial());
      });
    });

    on<SignupDoctorPageTwoSubmitted>((event, emit) {
      emit(SignupLoading());

      // Perform signup with all data
      Future.delayed(const Duration(seconds: 1), () {
        emit(SignupSuccess());
      });
    });
  }
}
