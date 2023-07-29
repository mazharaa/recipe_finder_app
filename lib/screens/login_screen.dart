import 'package:flutter/material.dart';
import 'package:recipe_finder_app/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Sign in to find your favorite food\'s recipe'),
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
            child: const Text('Login')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              child: const Text('Create account')
          ),
          TextButton(
            onPressed: () {
              
            }, 
            child: const Text('Forgot password?')
          )
        ],
      ),
    );
  }
}
