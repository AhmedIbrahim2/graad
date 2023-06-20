import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/dctorsignupformat.dart';
import 'package:flutter_application_1/widgets/navbar_roots.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/profile.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarRoots(),
                      ));
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(
                    color: Color(0xFF7165D6),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("assets/images/doctors.png"),
            ),
            SizedBox(height: 50),
            Text(
              "WELCOME TO OUR CLINICS",
              style: TextStyle(
                color: Color(0xFF7165D6),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            //  SizedBox(height: 10),
            // Center(
            // child:Text(
            //   "The art of medicine consists in amusing the patient while nature cures the disease.",
            //   style: TextStyle(
            //   color: Color(0xFF7165D6),
            //   fontSize: 18,
            //   fontWeight: FontWeight.w300,

            //   ),
            // ),
            // ),
            SizedBox(height: 15),
            Text(
              "The art of medicine consists in amusing the patient while nature cures the disease.",
              style: TextStyle(
                color: Color.fromARGB(255, 103, 90, 216),
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
                wordSpacing: 1,
              ),
            ),
            SizedBox(height: 60),
            Material(
              color: Color(0xFF7165D6),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorSignupForm(),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Text(
                    "Sign Up As Doctor",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Material(
              color: Color(0xFF7165D6),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Text(
                    "Sign Up As Patient",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
