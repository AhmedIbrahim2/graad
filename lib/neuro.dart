
import 'package:flutter/material.dart';
import 'app1.dart';
import 'app2.dart';
import 'app3.dart';
import 'app4.dart';




class Neuro extends StatelessWidget {
  final List<Widget> pages = [
    //Upcoming Widget
    AppointScreen(),
    //Competed Widget
    AppointScreen1(),
    //Canceled Widget
    AppointScreen2(),
    AppointScreen3(),
  ];
  final List<String> imgs = [
    "doctor10.jpg",
    "doctor11.jpg",
        "doctor12.jpg",

        "doctor13.jpg",

  ];
  final List<String> dep = [
    "Dr/Mostafa",
    "Dr/Mohamed",
    "Dr/Nahla",
    "Dr/Amer",
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
                          color:   Color(0xFF7165D6),
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
                              AssetImage("assets/images/neurosurgery.jpeg"),
                        ),
                        SizedBox(height: 17),
                        Text(
                          "Neurosurgery",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color:  Color(0xFF7165D6),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '"It is the medical specialty concerned with the diagnosis and treatment of of patients with injury to, or diseases/disorders of the brain, spinal cord and spinal column, and peripheral nerves within all parts of the body. "',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color:    Color(0xFF7165D6),
                            fontSize: 19,
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
            
                  SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 11),
            child: Text(
              '"Doctors"',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color:   Color.fromARGB(255, 0, 0, 0),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pages[index]));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color:   Color(0xFF7165D6),
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
      
      
    );
  }
}