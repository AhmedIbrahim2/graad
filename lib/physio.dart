import 'package:flutter/material.dart';
import 'package:flutter_application_1/physiotherapy/app1.dart';
import 'package:flutter_application_1/physiotherapy/app2.dart';
import 'package:flutter_application_1/physiotherapy/app3.dart';
import 'package:flutter_application_1/physiotherapy/app4.dart';

class Physio extends StatelessWidget {
  final List<Widget> pages = [
    //Upcoming Widget
    AppointScreen4(),
    //Competed Widget
    AppointScreen5(),
    //Canceled Widget
    AppointScreen6(),
    AppointScreen7(),
  ];
  final List<String> imgs = [
    "doctor6.jpg",
    "doctor7.jpg",
    "doctor8.jpg",
    "doctor9.jpg",
  ];
  final List<String> dep = [
    "Dr/Mona",
    "Dr/Mohamed",
    "Dr/Ahmed",
    "Dr/Dina",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xFF7165D6),
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/images/physiotherapy.jpg"),
                          ),
                          SizedBox(height: 17),
                          Text(
                            "Physiotherapy",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7165D6),
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            '"Physiotherapy helps to restore movement and function when someone is affected by injury, illness or disability "',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF7165D6),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 11),
                child: Text(
                  '"Doctors"',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pages[index]));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF7165D6),
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/images/${imgs[index]}"),
                          ),
                          Text(
                            "${dep[index]}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )
        // ],
        // ),
        // )

        );
  }
}
