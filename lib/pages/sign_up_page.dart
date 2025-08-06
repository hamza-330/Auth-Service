import 'package:complete_flutter_api/constants.dart';
import 'package:complete_flutter_api/widgets/custom_button.dart';
import 'package:complete_flutter_api/widgets/custom_text_field.dart';
import 'package:complete_flutter_api/widgets/custum_text_field_password.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                'https://dev.zeustra.com/assets/brand/ZeusFace.png',
                height: 80,
                width: 80,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                CustomTextField(
                  hintText: '',
                  width: 195,
                  labelText: 'First Name',
                  icon: Icon(Icons.person),
                ),
                SizedBox(width: 20),
                CustomTextField(
                  hintText: '',
                  width: 195,
                  labelText: 'Last Name',
                  icon: Icon(Icons.person_add_alt_1),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: '',
              labelText: 'Email',
              icon: Icon(Icons.email),
            ),
            SizedBox(height: 20),
            CustumTextFieldPassword(),
            SizedBox(height: 20),
            CustomTextField(
              hintText: '',
              labelText: 'Confirm Password',
              icon: Icon(Icons.lock),
            ),
            SizedBox(height: 40),
            CustomButton(),
            SizedBox(height: 20),
            Text(
              'Already have an account?',
              style: TextStyle(fontSize: 16, color: kblue),
            ),
          ],
        ),
      ),
    );
  }
}
