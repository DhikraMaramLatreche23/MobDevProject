abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class PersonalInfoValid extends SignUpState {}

class ProfessionalInfoValid extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {
  final String message;

  SignUpError(this.message);
}
