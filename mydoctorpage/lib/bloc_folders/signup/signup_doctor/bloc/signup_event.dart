abstract class SignUpEvent {}

class SubmitPersonalInfo extends SignUpEvent {
  final String name;
  final String surname;
  final String email;
  final String password;
  final String confirmPassword;

  SubmitPersonalInfo({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class SubmitProfessionalInfo extends SignUpEvent {
  final String speciality;
  final String address;
  final String phone;
  final String description;

  SubmitProfessionalInfo({
    required this.speciality,
    required this.address,
    required this.phone,
    required this.description,
  });
}
