import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/emailform.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/signup.dart';

import 'constants/constants.dart';
import 'doctor/home.dart';
import 'widgets/navbar_roots.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passToggle = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset("assets/images/doctors.png"),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter User Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(
                          passToggle
                              ? CupertinoIcons.eye_slash_fill
                              : CupertinoIcons.eye_fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      color: Color(0xFF7165D6),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          signIn(emailController.text, passwordController.text);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 40,
                          ),
                          child: Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmailForm(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7165D6),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ),
                        );
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7165D6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        String role = documentSnapshot.get('role');

        if (role == "Patient") {
          Constants.userRole = "Patient";
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavBarRoots(),
            ),
          );
        } else if (role == "Doctor") {
          Constants.userRole = "Doctor";
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDoctor(),
            ),
          );
        } else {
          print('Invalid user role');
        }
      } else {
        print('Document does not exist in the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }
}
