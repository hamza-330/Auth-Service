import 'package:complete_flutter_api/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Zuestra());
}

class Zuestra extends StatelessWidget {
  const Zuestra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SignUpPage(),
    );
  }
}
