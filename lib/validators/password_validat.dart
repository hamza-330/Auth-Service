String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a password';
  }

  final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>_]).{6,}$',
  );

  if (!passwordRegex.hasMatch(value)) {
    return 'ُTry a mix of letters capital and small, numbers, and symbols';
  }

  return null;
}
