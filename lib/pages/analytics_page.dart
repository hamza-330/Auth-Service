import 'package:complete_flutter_api/constants.dart';
import 'package:complete_flutter_api/pages/sign_out_page.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});
  static String id = 'AnalyticsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 120, right: 80),
          child: Row(
            children: [
              Image.network(kLogo, height: 50, width: 50),
              Text('Zuestra'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 700),
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
                  onPressed: () {},
                ),
              ),

              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    Navigator.pushNamed(context, SignOutPage.id);
                  },
                ),
                label: 'Sign out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
