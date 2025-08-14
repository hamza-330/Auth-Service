import 'package:complete_flutter_api/constants.dart';
import 'package:complete_flutter_api/helper/sign_in_provider.dart';
import 'package:complete_flutter_api/pages/sign_out_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});
  static String id = 'AnalyticsPage';
  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<SignInProvider>(context, listen: false).loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<SignInProvider>().loggedInUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(kLogo, width: 40, height: 40),
            const Text("Zuestra"),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
        ],
      ),
    );
  }
}
