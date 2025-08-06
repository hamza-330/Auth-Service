import 'package:complete_flutter_api/constants.dart';
import 'package:flutter/material.dart';

class CustumTextFieldPassword extends StatefulWidget {
  const CustumTextFieldPassword({super.key});

  @override
  State<CustumTextFieldPassword> createState() =>
      _CustumTextFieldPasswordState();
}

class _CustumTextFieldPasswordState extends State<CustumTextFieldPassword> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 410,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        focusNode: textFieldFocusNode,

        cursorColor: kblue,

        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: kblue),

          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kblue, width: 2),
          ),
          hintText: '',
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(_obscured ? Icons.visibility : Icons.visibility_off),
            onPressed: _toggleObscured,
          ),
        ),
        style: TextStyle(
          fontSize: 18,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
