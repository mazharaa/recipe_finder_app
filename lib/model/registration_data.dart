import 'package:flutter/cupertino.dart';

class RegistrationData extends ChangeNotifier {
  late String _fullName;
  late String _email;
  late String _password;
  late String _confPassword;

  set fullName (String newName) {
    _fullName = newName;
    notifyListeners();
  }

  set email (String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  set password (String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  set confPassword (String newConfPassword) {
    _confPassword = newConfPassword;
    notifyListeners();
  }

  void registrationData (
      String newName, String newEmail,
      String newPassword, String newConfPassword
    ) {
    _fullName = newName;
    _email = newEmail;
    _password = newPassword;
    _confPassword = newConfPassword;
    notifyListeners();
  }

  String get fullName => _fullName;
  String get email => _email;
  String get password => _password;
  String get confPassword => _confPassword;
}