import 'package:firebase/CORE/app_theme.dart';
import 'package:firebase/features/auth/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase/features/auth/login.dart';
//import 'package:firebase/features/auth/signup.dart';
import 'package:flutter/material.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: Authscreen(),
    );
  }
}
