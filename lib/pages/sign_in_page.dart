import 'package:complete_flutter_api/constants.dart';
import 'package:complete_flutter_api/helper/sign_in_provider.dart';

import 'package:complete_flutter_api/pages/analytics_page.dart';
import 'package:complete_flutter_api/pages/forget_password.dart';

import 'package:complete_flutter_api/pages/sign_up_page.dart';
import 'package:complete_flutter_api/service/sign_in_service.dart';
import 'package:complete_flutter_api/validators/email_validat.dart';
import 'package:complete_flutter_api/validators/password_validat.dart';
import 'package:complete_flutter_api/widgets/custom_button.dart';

import 'package:complete_flutter_api/widgets/custom_text_field.dart';
import 'package:complete_flutter_api/widgets/custum_text_field_password.dart'
    show CustomTextFieldPassword;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  static String id = 'SignInPage';
  final _formKey = GlobalKey<FormState>();
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
                  'Sign In',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),

              const SizedBox(height: 20),
              CustomTextField(
                obscureText: false,
                onChanged: (value) {
                  if (value == null) return;
                  context.read<SignInProvider>().setEmail(value);
                },
                hintText: '',
                labelText: 'Email',
                validator: validateEmail,
              ),

              const SizedBox(height: 20),
              CustomTextFieldPassword(
                onChanged: (value) {
                  if (value == null) return;
                  context.read<SignInProvider>().setPassword(value);
                },

                validator: validatePassword,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetPassword.id);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: kblue,
                      decoration: TextDecoration.underline,
                      decorationColor: kblue,
                      decorationThickness: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Sign In',
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    final signInProvider = context.read<SignInProvider>();

                    final email = signInProvider.email.trim();
                    final password = signInProvider.password.trim();

                    final user = await signInUser(email, password);

                    if (user != null) {
                      signInProvider.loggedInUser = user;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login Successful!')),
                      );

                      signInProvider.setEmail('');
                      signInProvider.setPassword('');

                      Navigator.pushNamed(context, AnalyticsPage.id);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: kblue,
                          content: Text('Invalid email or password'),
                        ),
                      );
                    }
                  }
                },
              ),

              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, SignUpPage.id);
                  },
                  child: Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(fontSize: 16, color: kblue),
                  ),
                ),
              ),
              SizedBox(height: 20),

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
