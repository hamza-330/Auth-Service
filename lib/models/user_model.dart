class UserModel {
  final String email;
  final String firstName;
  String? lastName;
  final String password;
  final String confirmPassword;
  final String? token;
  final String? id;
  UserModel(
    this.token,
    this.id, {
    required this.email,
    required this.firstName,
    this.lastName,
    required this.password,
    required this.confirmPassword,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['token'],
      json['id'],
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      confirmPassword: json['confirmPassword'],
    );
  }
}
