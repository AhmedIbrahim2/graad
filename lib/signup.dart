import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';

import 'constants/constants.dart';
import 'constants/store.dart';
import 'model/patient.dart';
import 'widgets/navbar_roots.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool passToggle = true;
  final Store _store = Store();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var userRole = "Patient";
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

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
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: passToggle ? true : false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: passToggle
                            ? Icon(CupertinoIcons.eye_slash_fill)
                            : Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      color: Color(0xFF7165D6),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            signUp(
                              emailController.text,
                              nameController.text,
                              passwordController.text,
                              userRole,
                              phoneController.text,
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: Center(
                            child: Text(
                              "Create Account",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: Text(
                        "Log In",
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

  void signUp(
    String email,
    String name,
    String password,
    String role,
    String phone,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      postDetailsToFirestore(email, name, role, phone);

      route();
    } catch (e) {
      print(e.toString());
    }
  }

  void postDetailsToFirestore(
    String email,
    String name,
    String role,
    String phone,
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('users');
    ref.doc(user!.uid).set({
      'email': email,
      'role': role,
      'name': name,
      'phone': phone,
    });
  }

  void route() {
    User? user = _auth.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        String userRole = documentSnapshot.get('role');
        Constants.userRole = userRole;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NavBarRoots(),
          ),
        );
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
