String? validateLastName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }

  // Only allow letters (a–z or A–Z)
  final nameRegExp = RegExp(r'^[a-zA-Z]+$');
  if (!nameRegExp.hasMatch(value.trim())) {
    return 'Last name must contain letters only';
  }

  if (value.trim().length < 2) {
    return 'Last name must be at least 2 characters';
  }

  if (value.trim().length > 30) {
    return 'Last name is too long';
  }

  return null;
}
