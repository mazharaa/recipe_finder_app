import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder_app/components/text_field.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  static const String id = 'registration_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox(
          height: (40 / 812) * MediaQuery.of(context).size.height,
          width: (40 / 375) * MediaQuery.of(context).size.width,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )
          ),
        ),
      ),
      body: const SubmitTextRegForm(),
    );
  }
}

class SubmitTextRegForm extends StatefulWidget {
  const SubmitTextRegForm({
    super.key
  });

  @override
  State<SubmitTextRegForm> createState() => _SubmitTextRegFormState();
}

class _SubmitTextRegFormState extends State<SubmitTextRegForm> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  String _name = '';
  String _email = '';
  String _password = '';
  String _confPassword = '';

  String? checkFieldEmpty(String? fieldContent) {
    if (fieldContent == null || fieldContent.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String? checkConfPassword(String? fieldContent) {
    if (fieldContent != _password) {
      return 'Password are not same';
    }
    return null;
  }

  bool _validation() {
    if (_name.isNotEmpty && _email.isNotEmpty
        && _password.isNotEmpty && _confPassword.isNotEmpty) {
      return true;
    }
    return false;
  }

  void _createUser() async {
    await _auth.createUserWithEmailAndPassword(
        email: _email, password: _password
    );
  }

  void _submit() {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      _createUser();
      _auth.authStateChanges().listen((User? user) async {
        if(user != null) {
          await user.updateDisplayName(_name);
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SubmitTextFormField(
            hintText: 'Full Name',
            submitted: _submitted,
            validator: checkFieldEmpty,
            onSubmit: (name) {
              setState(() {
                _name = name;
              });
            }
          ),
          SubmitTextFormField(
            hintText: 'Email',
            submitted: _submitted,
            validator: checkFieldEmpty,
            onSubmit: (email) {
              setState(() {
                _email = email;
              });
            }
          ),
          SubmitTextFormField(
            hintText: 'Password',
            submitted: _submitted,
            validator: checkFieldEmpty,
            obscuringText: true,
            onSubmit: (password) {
              setState(() {
                _password = password;
              });
            }
          ),
          SubmitTextFormField(
            hintText: 'Confirm Password',
            submitted: _submitted,
            validator: checkConfPassword,
            obscuringText: true,
            onSubmit: (confPass) {
              setState(() {
                _confPassword = confPass;
              });
            }
          ),
          ElevatedButton(
              onPressed: _validation() ? _submit : null,
              child: const Text('Register')
          ),
        ],
      ),
    );
  }
}
