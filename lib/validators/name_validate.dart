String? validateFirstName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'First name is required';
  }

  final nameRegExp = RegExp(r'^[a-zA-Z]+$');
  if (!nameRegExp.hasMatch(value.trim())) {
    return ' must contain letters only';
  }

  if (value.trim().length < 2) {
    return ' must be at least 2 characters';
  }

  if (value.trim().length > 30) {
    return 'First name is too long';
  }

  return null;
}
