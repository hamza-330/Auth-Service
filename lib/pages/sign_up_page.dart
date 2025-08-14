import 'package:complete_flutter_api/constants.dart';

import 'package:complete_flutter_api/helper/sign_up_provider.dart';

import 'package:complete_flutter_api/pages/sign_in_page.dart';
import 'package:complete_flutter_api/service/sign_up_service.dart';

import 'package:complete_flutter_api/validators/email_validat.dart';
import 'package:complete_flutter_api/validators/last_name_validate.dart';
import 'package:complete_flutter_api/validators/name_validate.dart';
import 'package:complete_flutter_api/validators/password_validat.dart';
import 'package:complete_flutter_api/widgets/custom_button.dart';
import 'package:complete_flutter_api/widgets/custom_text_field.dart';
import 'package:complete_flutter_api/widgets/custum_text_field_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String id = 'signUpPage';
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.only(top: 50),
            shrinkWrap: true,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xff4281D4),
                radius: 50,
                child: Image.network(kLogo, height: 85, width: 85),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),

              Row(
                children: [
                  CustomTextField(
                    controller: firstNameController,
                    onChanged: (value) {
                      if (value == null) return;
                      context.read<SignUpProvider>().setFirstName(value);
                    },
                    hintText: '',
                    width: 195,
                    labelText: 'First Name',
                    validator: validateFirstName,
                    obscureText: false,
                  ),
                  const SizedBox(width: 20),
                  CustomTextField(
                    controller: lastNameController,
                    obscureText: false,
                    onChanged: (value) {
                      if (value == null) return;
                      context.read<SignUpProvider>().setLastName(value);
                    },
                    hintText: '',
                    width: 195,
                    labelText: 'Last Name',
                    validator: validateLastName,
                  ),
                ],
              ),

              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                obscureText: false,
                onChanged: (value) {
                  if (value == null) return;
                  context.read<SignUpProvider>().setEmail(value);
                },
                hintText: '',
                labelText: 'Email',
                validator: validateEmail,
              ),

              const SizedBox(height: 20),
              CustomTextFieldPassword(
                onChanged: (value) {
                  if (value == null) return;
                  context.read<SignUpProvider>().setPassword(value);
                },
                controller: passwordController,
                validator: validatePassword,
              ),

              const SizedBox(height: 20),
              CustomTextField(
                obscureText: true,
                hintText: '',
                labelText: 'Confirm Password',
                onChanged: (value) {
                  if (value == null) return;
                  context.read<SignUpProvider>().setConfirmPassword(value);
                },
                validator: (value) {
                  if (value != context.read<SignUpProvider>().password) {
                    return 'Password not match';
                  } else {
                    return null;
                  }
                },
                controller: confirmPasswordController,
              ),

              const SizedBox(height: 40),
              CustomButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    signUpUser(
                      context.read<SignUpProvider>().email.toString(),
                      context.read<SignUpProvider>().password.toString(),
                      context.read<SignUpProvider>().firstName.toString(),
                      context.read<SignUpProvider>().confirmPassword.toString(),
                      context.read<SignUpProvider>().lastName.toString(),
                    );
                    passwordController.clear();
                    firstNameController.clear();
                    lastNameController.clear();
                    emailController.clear();
                    confirmPasswordController.clear();

                    Navigator.pushNamed(context, SignInPage.id);
                  } else {
                    print('Form is not valid.');
                  }
                },
                text: 'Sign Up',
              ),

              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignInPage.id);
                  },
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 16, color: kblue),
                  ),
                ),
              ),

              const SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Copyright',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      ' Zuestra Platform ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '2025.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
