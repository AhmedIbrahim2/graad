import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _sendEmail() {
    if (_formKey.currentState!.validate()) {
      // Do something with the email, such as sending it to a server
      final email = _emailController.text;
      print('Sending email to $email...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Color(0xFF7165D6),

        title: Text('Enter Your Email'),
      ),
      body: Center(
        
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Please enter your email address:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'example@example.com',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email address';
                    } else if (!value!.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                 SizedBox(height:20),
                Material(
                    color: Color(0xFF7165D6),
                    borderRadius: BorderRadius.circular(10),
                      
                        child: Center(
                          child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    child: Text('Send' ,
                     style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),),
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
}