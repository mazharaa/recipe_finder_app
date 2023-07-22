import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  static const String id = 'registration_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'E-mail'
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Password'
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'E-mail'
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Password'
            ),
          ),
          ElevatedButton(
              onPressed: () {

              },
              child: const Text('Register')
          ),
        ],
      ),
    );
  }
}
