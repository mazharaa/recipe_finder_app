import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder_app/components/text_field.dart';
import 'package:recipe_finder_app/screens/home_screen.dart';
import 'package:recipe_finder_app/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';
  bool _submitted = false;

  String? checkFieldEmpty(String? fieldContent) {
    if (fieldContent == null || fieldContent.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  bool _validation() {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      return true;
    }
    return false;
  }

  void _login () async {
    try {
      await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password
      );
      Navigator.pushNamed(context, HomeScreen.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void _submit () {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      _login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign in to find your favorite food\'s recipe'),
            SubmitTextFormField(
              hintText: 'E-mail',
              validator: checkFieldEmpty,
              submitted: _submitted,
              onSubmit: (email) {
                setState(() {
                  _email = email;
                });
              }
            ),
            SubmitTextFormField(
              hintText: 'Password',
              validator: checkFieldEmpty,
              obscuringText: true,
              submitted: _submitted,
              onSubmit: (password) {
                setState(() {
                  _password = password;
                });
              }
            ),
            ElevatedButton(
              onPressed: _validation() ? _submit : null,
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
      ),
    );
  }
}
