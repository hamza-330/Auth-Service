import 'package:complete_flutter_api/helper/forget_password_provider.dart';
import 'package:complete_flutter_api/helper/sign_in_provider.dart';
import 'package:complete_flutter_api/helper/sign_up_provider.dart';

import 'package:complete_flutter_api/pages/analytics_page.dart';
import 'package:complete_flutter_api/pages/forget_password.dart';
import 'package:complete_flutter_api/pages/sign_in_page.dart';
import 'package:complete_flutter_api/pages/sign_out_page.dart';
import 'package:complete_flutter_api/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => ForgetPasswordProvider()),
      ],
      child: const Zuestra(),
    ),
  );
}

class Zuestra extends StatelessWidget {
  const Zuestra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        SignUpPage.id: (context) => SignUpPage(),
        SignInPage.id: (context) => SignInPage(),
        ForgetPassword.id: (context) => ForgetPassword(),
        AnalyticsPage.id: (context) => const AnalyticsPage(),
        SignOutPage.id: (context) => SignOutPage(),
      },
      debugShowCheckedModeBanner: false,

      home: SignUpPage(),
    );
  }
}
