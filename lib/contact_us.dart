import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF7165D6),
      // body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Container(
              height: 130,
              // width: 150,
            ),
          ),
          SizedBox(height: 50),
          Text(
            "Contact Us",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "We are happy to contact you",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
          Text(
            "For any inquiries,Please contact us.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Your Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Your Message",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                MaterialButton(
                  //    borderRadius: BorderRadius.circular(10),
                  //    child: InkWell(
                  // onTap: (){
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //       builder: (context) =>Signup(),
                  //       ));
                  // },
                  //    ),

                  height: 40,
                  minWidth: double.infinity,
                  color: Colors.white,
                  // onPressed: () {},
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ));
                  },
                  child: Text(
                    "Send Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7165D6),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // ),
    );
  }
}
