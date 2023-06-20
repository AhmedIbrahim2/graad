import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class AppointScreen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /2.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/doctor2.jpg"
                  ),

                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),

                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF7165D6).withOpacity(0.9),
                       Color(0xFF7165D6).withOpacity(0),
                       Color(0xFF7165D6).withOpacity(0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30,left:10,right: 10 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                               Navigator.pop(context);
                              },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F8FF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_back,
                                    color: Color(0xFF7165D6),size: 28),
                              ),
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                    // SizedBox(height: 60,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     children: [
                    //       Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(
                    //                 "Patients",
                    //                 style: TextStyle(
                    //                   fontSize: 20,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Color(0xFFD9E4EE),
                    //                 ),
                    //               ),
                    //               SizedBox(height: 8),
                    //               Text(
                    //                 "1.8k",
                    //                 style: TextStyle(
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.w500,
                    //                   color: Color(0xFFD9E4EE),
                    //                 ),
                    //               )

                    //             ],
                    //           ),
                            
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),

            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr Omnia",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color:Color(0xFF7165D6),
                    ),
                  ),
                  SizedBox(height:5),
                  Row(children: [
                    Icon(Icons.medical_information,
                        color: Colors.red,
                        size: 28),
                    SizedBox(width: 5),
                    Text(
                      "surgon",
                      style: TextStyle(
                        fontSize: 17,
                        color:Colors.black.withOpacity(0.6),

                      ),
                    )

                  ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lorem ipsum dolor sit amet,conempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(
                      fontSize: 15,
                      color:Colors.black.withOpacity(0.6),

                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Book Date",
                    style: TextStyle(
                      fontSize: 18,
                      color:Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 31,
                      itemBuilder:(context,index){
                        return InkWell(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 25),
                            decoration: BoxDecoration(
                              color: index==1? Color(0xFF7165D6):Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFD9E4EE),
                                  blurRadius: 4,
                                  spreadRadius: 2,

                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${index +1}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: index ==1
                                        ?Colors.white
                                        :Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                Text(
                                  "DEC",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: index ==1
                                        ?Colors.white
                                        :Colors.black.withOpacity(0.6),
                                  ),
                                )
                              ],
                            ),

                          ),

                        );
                      } ,
                    ),
                  ),

                  SizedBox(height: 8),
                  Text(
                    "Book Time",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 24,
                      itemBuilder:(context,index){
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                          decoration: BoxDecoration(
                            color: index==2 ? Color(0xFF7165D6):Colors.white,
                            borderRadius:  BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(child:Text(
                            "${index + 1} :00 AM",
                            style: TextStyle(
                              fontSize: 17,
                              color: index ==2
                                  ?Colors.white
                                  :Colors.black.withOpacity(0.6),
                            ),

                          ),
                          ),
                        );

                      },


                    ),
                  ),
                  SizedBox(height: 50),
                  Material(
                    color: Color(0xFF7165D6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Book Appointment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}