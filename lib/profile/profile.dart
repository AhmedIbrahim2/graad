import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/profile/about_us.dart';
import 'package:flutter_application_1/widgets/navbar_roots.dart';

import '../model/patient.dart';

class UserProfileScreen extends StatefulWidget {
  final String userId;

  const UserProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _phone;
  late String _role;
  bool _isEditing = false;
  late UserModel _userModel = UserModel(
    userId: '',
    userName: '',
    userEmail: '',
    userPhone: '',
    userRole: '',
  );

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .get();
    setState(() {
      _userModel = UserModel(
        userId: doc.data()!['userId'],
        userName: doc.data()!['name'],
        userEmail: doc.data()!['email'],
        userPhone: doc.data()!['phone'],
        userRole: doc.data()!['role'],
      );
      _name = _userModel.userName ?? '';
      _email = _userModel.userEmail ?? '';
      _phone = _userModel.userPhone ?? '';
      _role = _userModel.userRole ?? '';
    });
  }

  Future<void> _updateUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .update({
      'name': _name,
      'email': _email,
      'phone': _phone,
      'role': _role,
    });
    setState(() {
      _userModel = UserModel(
        userId: _userModel.userId,
        userName: _name,
        userEmail: _email,
        userPhone: _phone,
        userRole: _role,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarRoots(),
                ));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = true;
              });
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Edit Profile'),
                    content: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              initialValue: _name,
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name is required';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _name = value;
                                });
                              },
                            ),
                            TextFormField(
                              enabled: false,
                              initialValue: _email,
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: _phone,
                              decoration: InputDecoration(
                                labelText: 'Phone',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _phone = value;
                                });
                              },
                            ),
                            TextFormField(
                              enabled: false,
                              initialValue: _role,
                              decoration: InputDecoration(
                                labelText: 'Role',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Role is required';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _role = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Save'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _updateUserData();
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.0),
              CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 80.0, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                _userModel.userName!,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                _userModel.userEmail!,
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  _userModel.userPhone!,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.badge),
                title: Text(
                  _userModel.userRole!,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
