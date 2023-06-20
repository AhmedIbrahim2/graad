import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DoctorProfileTab(),
    AppointmentTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xFF7165D6),
        title: Text(_currentIndex == 0 ? 'Profile' : 'Appointment'),
      ),
     
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color(0xFF7165D6),
        
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF7165D6),
           
            icon: Icon(Icons.person),
            
            label: 'Profile' 
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
        ],
      ),
    );
  }
}

class DoctorProfileTab extends StatelessWidget {
  final double labelFontSize = 20;
  final double nameFontSize = 16;
  final double screenHeight = 700;
  final double screenWidth = 400;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/doctor1.jpg'),
                
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Dr/Eman',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Cardiologist',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 16),
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
                  child: Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'From:',
                        style: TextStyle(fontSize: nameFontSize),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        '8.00 AM',
                        style: TextStyle(fontSize: nameFontSize),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'To:',
                        style: TextStyle(fontSize: nameFontSize),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        '5.00 PM',
                        style: TextStyle(fontSize: nameFontSize),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Address',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: Text(
                    'Maadi',
                    style: TextStyle(fontSize: nameFontSize),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Appointment',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '',
                  style: TextStyle(fontSize: nameFontSize),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.2),
          ],
        ),
      ),
    );
  }
}

class Appointment {
  final String id;
  final String patientName;
  final String doctorName;
  final DateTime date;
  final String time;

  Appointment({
    required this.id,
    required this.patientName,
    required this.doctorName,
    required this.date,
    required this.time,
  });
}

class AppointmentTab extends StatelessWidget {
  final List<Appointment> _appointments = [
    Appointment(
      id: '1',
      patientName: 'Alice Smith',
      doctorName: 'John Doe',
      date: DateTime.now().add(Duration(days: 1)),
      time: '10:00 AM',
    ),
    Appointment(
      id: '2',
      patientName: 'Bob Johnson',
      doctorName: 'John Doe',
      date: DateTime.now().add(Duration(days: 2)),
      time: '2:30 PM',
    ),
    Appointment(
      id: '3',
      patientName: 'Carol Lee',
      doctorName: 'John Doe',
      date: DateTime.now().add(Duration(days: 3)),
      time: '9:45 AM',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _appointments.length,
          itemBuilder: (BuildContext context, int index) {
            Appointment appointment = _appointments[index];
            return ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                'Appointment with ${appointment.patientName}',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text('Time: ${appointment.time}'),
              trailing: Text(
                  '${appointment.date.day}/${appointment.date.month}/${appointment.date.year}'),
            );
          },
        ),
      ),
    );
  }
}
