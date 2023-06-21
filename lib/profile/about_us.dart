import 'package:flutter/material.dart';

import '../widgets/navbar_roots.dart';

class AboutUs extends StatelessWidget {
  AboutUs();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7165D6),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarRoots(),
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF7165D6),
                  Color(0xFF9C6FFC),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "We are a team of six passionate developers who collaborated on this project as our graduation requirement. Our goal was to create an innovative healthcare solution that enhances accessibility for everyone.\n\nOur app incorporates four main features:\n\n1. Prescription Reader: Patients can scan handwritten prescriptions to extract medicine names, dosages, and frequencies.\n\n2. X-Ray Reader: Our app utilizes advanced image processing algorithms to analyze X-ray images and provide insights.\n\n3. Appointment Booking: Users can easily schedule appointments with doctors across various departments, including Cardiology, Physiotherapy, Neurosurgery, and Nutrition.\n\n4. Feedback System: We value user feedback and have integrated a feedback feature to gather user suggestions and improve our app.\n\nWe are dedicated to providing a seamless and user-friendly experience, and we continuously strive to enhance our app to meet the evolving needs of our users.",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
