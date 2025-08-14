String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter an email';
  }

  final RegExp emailRegex = RegExp(
    r'^(?=[^@]*[a-zA-Z])(?=[^@]*[^0-9@])[^@\s]+@[^\s@]+\.[^\s@]+$',
  );

  if (!emailRegex.hasMatch(value)) {
    return 'Email is not valid';
  }
  if (value.trim().length > 30) {
    return 'Email is too long';
  }
  if (value.trim().length < 4) {
    return 'Email is too short';
  }

  return null;
}
