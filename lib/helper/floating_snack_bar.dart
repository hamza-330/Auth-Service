import 'package:flutter/material.dart';

class FloatingSnackBar extends StatelessWidget {
  const FloatingSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(68, 76, 175, 79),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'A password reset link has been sent to your email wait 10 minutes',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
