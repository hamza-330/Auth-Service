import 'package:complete_flutter_api/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  const CustomTextFieldPassword({
    super.key,
    required this.onChanged,
    this.validator,
    this.controller,
  });

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  bool _hasError = false;

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
        controller: widget.controller,
        validator: (value) {
          final result = widget.validator?.call(value);
          setState(() {
            _hasError = result != null && result.isNotEmpty;
          });
          return result;
        },
        onChanged: widget.onChanged,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        focusNode: textFieldFocusNode,
        cursorColor: kblue,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
            color: _hasError ? Color(0xffF2B8B5) : kblue,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kblue),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF2B8B5)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF2B8B5)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(_obscured ? Icons.visibility_off : Icons.visibility),
            onPressed: _toggleObscured,
          ),
        ),
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
