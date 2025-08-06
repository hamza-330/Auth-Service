import 'package:complete_flutter_api/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.width,
    required this.labelText,
    this.icon,
  });

  final String hintText;
  final int? width;
  final String labelText;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.toDouble() ?? 410,
      child: TextFormField(
        cursorColor: kblue,

        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: kblue),
          suffixIcon: icon,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kblue, width: 2),
          ),

          hintText: hintText,
          labelText: labelText,
        ),
        style: TextStyle(
          fontSize: 18,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
