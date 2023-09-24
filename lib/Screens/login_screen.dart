import 'package:flutter/material.dart';
import 'package:macro_one/Screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var email = "";
  var password = "";
  void signUserIn() async {
    print('Attempting to sign in!');

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('User not found!');
        Navigator.pop(context);
      } else if (e.code == 'wrong-password') {
        print('Wrong password!');
        Navigator.pop(context);
      } else if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Navigator.pop(context);
      }
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff1A3C7B),
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(top: 60.0),
              //   child: Center(
              //     child: Container(
              //         width: 200,
              //         height: 150,
              //         /*decoration: BoxDecoration(
              //             color: Colors.red,
              //             borderRadius: BorderRadius.circular(50.0)),*/
              //         child: Image.asset('asset/images/flutter-logo.png')),
              //   ),
              // ),
              SizedBox(
                height: 150,
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 45),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),

              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xff1A3C7B),
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        email = emailController.text;

                        password = passwordController.text;
                      });
                      signUserIn();
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//#1A3C7B e #FFE500