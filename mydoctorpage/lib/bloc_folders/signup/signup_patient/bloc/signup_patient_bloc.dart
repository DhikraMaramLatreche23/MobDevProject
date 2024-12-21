import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_patient_event.dart';
import 'signup_patient_state.dart';

class SignupPatientBloc extends Bloc<SignupPatientEvent, SignupPatientState> {
  SignupPatientBloc() : super(SignupPatientInitial()) {
    on<SignupPatientPageSubmitted>((event, emit) async {
      emit(SignupPatientLoading());

      // Simulate validation or API call
      await Future.delayed(const Duration(seconds: 1));

      if (event.email.contains("@example.com")) {
        emit(const SignupPatientFailure("Invalid email domain!"));
      } else {
        emit(SignupPatientSuccess());
      }
    });
  }
}
