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

  return null;
}
