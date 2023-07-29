import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_app/model/registration_data.dart';
import 'package:recipe_finder_app/screens/home_screen.dart';
import 'package:recipe_finder_app/screens/login_screen.dart';
import 'package:recipe_finder_app/screens/registration_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RecipeFinderApp());
}

class RecipeFinderApp extends StatelessWidget {
  const RecipeFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistrationData(),
      child: MaterialApp(
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id : (context) => const LoginScreen(),
          RegistrationScreen.id : (context) => const RegistrationScreen(),
          HomeScreen.id : (context) => const HomeScreen()
        },
      ),
    );
  }
}

