import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      body: const TextSubmitForm(),
    );
  }
}

class TextSubmitForm extends StatefulWidget {
  const TextSubmitForm({
    super.key
  });

  @override
  State<TextSubmitForm> createState() => _TextSubmitFormState();
}

class _TextSubmitFormState extends State<TextSubmitForm> {
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
          RegTextFormField(
            hintText: 'Full Name',
            submitted: _submitted,
            validator: checkFieldEmpty,
            onSubmit: (name) {
              setState(() {
                _name = name;
              });
            }
          ),
          RegTextFormField(
            hintText: 'Email',
            submitted: _submitted,
            validator: checkFieldEmpty,
            onSubmit: (email) {
              setState(() {
                _email = email;
              });
            }
          ),
          RegTextFormField(
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
          RegTextFormField(
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

class RegTextFormField extends StatelessWidget {
  const RegTextFormField({
    super.key,
    this.hintText,
    this.submitted,
    required this.onSubmit,
    this.validator,
    this.obscuringText = false
  });

  final String? hintText;
  final bool? submitted;
  final ValueChanged<String> onSubmit;
  final String? Function(String?)? validator;
  final bool obscuringText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText
      ),
      autovalidateMode: submitted!
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled,
      validator: validator,
      onChanged: (text) => onSubmit(text),
      obscureText: obscuringText,
    );
  }
}

