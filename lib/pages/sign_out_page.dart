import 'package:complete_flutter_api/constants.dart';
import 'package:complete_flutter_api/pages/analytics_page.dart';
import 'package:complete_flutter_api/pages/sign_up_page.dart';
import 'package:complete_flutter_api/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({super.key});
  static String id = 'SignOutPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xff4281D4),
                radius: 50,
                child: Image.network(kLogo, height: 85, width: 85),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Are you sure you want to sign out?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 100),
              CustomButton(
                text: 'Sign out',
                onTap: () {
                  Navigator.pushNamed(context, SignUpPage.id);
                },
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 400),
                child: Center(
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Color(0xff2e4b70),
                    elevation: 0,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        label: 'Analytics',
                        icon: IconButton(
                          color: Colors.white,
                          hoverColor: Colors.blue,
                          icon: Icon(Icons.analytics),
                          onPressed: () {
                            Navigator.pop(context, AnalyticsPage.id);
                          },
                        ),
                      ),

                      BottomNavigationBarItem(
                        icon: IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () {},
                        ),
                        label: 'Sign out',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
