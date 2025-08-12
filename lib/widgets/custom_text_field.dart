import 'package:complete_flutter_api/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.width,
    required this.labelText,
    required this.onChanged,
    required this.obscureText,
    this.validator,
    this.controller,
  });

  final TextEditingController? controller;
  final Function(String?) onChanged;
  final String hintText;
  final int? width;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.toDouble() ?? 410,
      child: TextFormField(
        controller: controller,
        validator: validator,
        cursorColor: kblue,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kblue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF2B8B5), width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF2B8B5), width: 2),
          ),
          floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return TextStyle(color: Color(0xffF2B8B5));
            }
            if (states.contains(WidgetState.focused)) {
              return TextStyle(color: kblue);
            }
            return TextStyle(color: Colors.grey);
          }),
          errorStyle: TextStyle(color: Color(0xffF2B8B5), fontSize: 14),
        ),
        style: TextStyle(fontSize: 18, color: Colors.white),
        onChanged: onChanged,
      ),
    );
  }
}
