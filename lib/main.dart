import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:macro_one/Screens/auth_page.dart';
import 'package:macro_one/Screens/home_screen.dart';

import 'Screens/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(debugShowCheckedModeBanner: false, home: AuthPage());
        FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('Something went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                print('firebase connected');
              } else {
                print('firebase not connected');
              }
              return MaterialApp(
                  theme: ThemeData(
                      // primarySwatch: Colors.blue,
                      ),
                  debugShowCheckedModeBanner: false,
                  home: 
                  LoginScreen()
                  // LandingPage(),
                  //AdminSide(),
                  );
            });
  }
}
