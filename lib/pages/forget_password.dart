import 'package:complete_flutter_api/helper/forget_password_provider.dart';

import 'package:complete_flutter_api/helper/floating_snack_bar.dart';

import 'package:complete_flutter_api/pages/sign_in_page.dart';
import 'package:complete_flutter_api/validators/email_validat.dart';
import 'package:complete_flutter_api/widgets/custom_button.dart';
import 'package:complete_flutter_api/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  static String id = 'ForgetPassword';

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  bool _showTextField = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 300),
            const Center(
              child: Text(
                'Forget your Password ?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),

            if (_showTextField)
              CustomTextField(
                obscureText: false,
                onChanged: (value) {
                  if (value == null) return;
                  context.read<ForgetPasswordProvider>().setEmail(value);
                },
                hintText: 'Enter your email',
                labelText: 'Email',
                validator: validateEmail,
              )
            else
              FloatingSnackBar(),

            const SizedBox(height: 50),

            CustomButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _showTextField = false;
                  });
                }
              },
              text: 'Send Reset Link',
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, SignInPage.id);
                },
                child: Text(
                  'BACK TO LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
