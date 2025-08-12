class UserModel {
  final String email;
  final String firstName;
  String? lastName;
  final String password;
  final String confirmPassword;

  UserModel({
    required this.email,
    required this.firstName,
    this.lastName,
    required this.password,
    required this.confirmPassword,
  });
}
