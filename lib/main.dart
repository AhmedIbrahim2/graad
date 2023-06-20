import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCBGMdi-1jWGaqRFJgM94HaeA9-ybo_9aY",
          appId: "graduationproject-66a5b",
          messagingSenderId: "messagingSenderId",
          projectId: "graduationproject-66a5b"));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Welcome(),
        "/login": (context) => const Login(),
        "/signup": (context) => const Signup(),
      },
    );
  }
}
