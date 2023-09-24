import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:macro_one/Screens/home_screen.dart';
import 'package:macro_one/Screens/login_screen.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData ? HomeScreen() : LoginScreen();
        },
      ),
    );
  }
}
