import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'doctor/home.dart';

class DoctorSignupForm extends StatefulWidget {
  const DoctorSignupForm({Key? key}) : super(key: key);

  @override
  _DoctorSignupFormState createState() => _DoctorSignupFormState();
}

class _DoctorSignupFormState extends State<DoctorSignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _qualificationsController = TextEditingController();
  final _specializationController = TextEditingController();
  final _timingController = TextEditingController();
  final _TotimingController = TextEditingController();

  final _addressController = TextEditingController();
  TimeOfDay? _fromTime;
  TimeOfDay? _toTime;
  final _auth = FirebaseAuth.instance;
  var userRole = "Doctor";

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _qualificationsController.dispose();
    _specializationController.dispose();
    _timingController.dispose();
    _addressController.dispose();
    _TotimingController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final qualifications = _qualificationsController.text;
      final specialization = _specializationController.text;
      final timing = _fromTime != null && _toTime != null
          ? '${_fromTime!.format(context)} - ${_toTime!.format(context)}'
          : '';
      final address = _addressController.text;
      print('Name: $name');
      print('Email: $email');
      print('Password: $password');
      print('Qualifications: $qualifications');
      print('Specialization: $specialization');
      print('Timing: $timing');
      print('Address: $address');
    }
  }

  Future<void> _selectFromTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _fromTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        _fromTime = time;
        _timingController.text = time.format(context);
      });
    }
  }

  Future<void> _selectToTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _toTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        _toTime = time;
        _TotimingController.text = time.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final nameFontSize = screenWidth * 0.04;
    final labelFontSize = screenWidth * 0.04;
    final inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      border: OutlineInputBorder(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7165D6),
        title: Text('Doctor Signup'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      fontSize: labelFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFormField(
                  controller: _nameController,
                  decoration: inputDecoration.copyWith(hintText: 'Enter name'),
                  style: TextStyle(fontSize: nameFontSize),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: labelFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration.copyWith(hintText: 'Enter email'),
                  style: TextStyle(fontSize: nameFontSize),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    if (!value!.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Password',
                  style: TextStyle(
                      fontSize: labelFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration:
                      inputDecoration.copyWith(hintText: 'Enter password'),
                  style: TextStyle(fontSize: nameFontSize),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a password';
                    }
                    if (value!.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Qualifications',
                  style: TextStyle(
                      fontSize: labelFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFormField(
                  controller: _qualificationsController,
                  decoration: inputDecoration.copyWith(
                      hintText: 'Enter qualifications'),
                  style: TextStyle(fontSize: nameFontSize),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your qualifications';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Specialization',
                  style: TextStyle(
                      fontSize: labelFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFormField(
                  controller: _specializationController,
                  decoration: inputDecoration.copyWith(
                      hintText: 'Enter specialization'),
                  style: TextStyle(fontSize: nameFontSize),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your specialization';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Timing',
                  style: TextStyle(
                    fontSize: labelFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _timingController,
                        decoration: inputDecoration.copyWith(
                          hintText: 'From',
                          prefixIcon: Icon(Icons.access_time),
                        ),
                        style: TextStyle(fontSize: nameFontSize),
                        readOnly: true,
                        onTap: _selectFromTime,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please select timing';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: TextFormField(
                        controller: _TotimingController,
                        decoration: inputDecoration.copyWith(
                          hintText: 'To',
                          prefixIcon: Icon(Icons.access_time),
                        ),
                        style: TextStyle(fontSize: nameFontSize),
                        readOnly: true,
                        onTap: _selectToTime,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please select timing';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Address',
                  style: TextStyle(
                      fontSize: labelFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFormField(
                  controller: _addressController,
                  decoration:
                      inputDecoration.copyWith(hintText: 'Enter address'),
                  style: TextStyle(fontSize: nameFontSize),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                MaterialButton(
                  color: Color(0xFF7165D6),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signUp(
                        _emailController.text,
                        _passwordController.text,
                        _nameController.text,
                        userRole,
                        _timingController.text,
                        _TotimingController.text,
                        _addressController.text,
                        _qualificationsController.text,
                        _specializationController.text,
                      );
                    }
                  },
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
    String password,
    String name,
    String role,
    String fromTime,
    String toTime,
    String address,
    String specialization,
    String qualifications,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      postDetailsToFirestore(email, name, role, fromTime, toTime, address,
          specialization, qualifications);

      route();
    } catch (e) {
      print(e.toString());
    }
  }

  void postDetailsToFirestore(
    String email,
    String name,
    String role,
    String fromTime,
    String toTime,
    String address,
    String specialization,
    String qualifications,
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('users');
    ref.doc(user!.uid).set({
      'email': email,
      'role': "Doctor",
      'specialization': specialization,
      'qualifications': qualifications,
      'address': address,
      'fromTime': fromTime,
      'toTime': toTime,
      'name': name,
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDoctor(),
          ),
        );
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
