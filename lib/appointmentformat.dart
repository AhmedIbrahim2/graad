
import 'package:flutter/material.dart';

class AppointmentForm extends StatefulWidget {
  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Do something with the form data, such as saving it to a database
      final name = _nameController.text;
      final description = _descriptionController.text;
      final dateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );
      print('Name: $name');
      print('Description: $description');
      print('Date and time: $dateTime');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        shadowColor:  Color.fromARGB(255, 0, 0, 0),
        backgroundColor:  Color(0xFF7165D6),
        title: Text('Appointment Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 16),
              Text(
                'Date and Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${_selectedDate.toLocal()}'.split(' ')[0],
                              style:
                                  TextStyle(fontSize: 16, color: Color(0xFF7165D6)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectTime(context),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Text(
                              'Time',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${_selectedTime.format(context)}',
                              style:
                                  TextStyle(fontSize: 16, color: Color(0xFF7165D6)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
                  Material(
                    color: Color(0xFF7165D6),
                    borderRadius: BorderRadius.circular(10),
                      
                        child: Center(
                          child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                          child: Text(
                            "Send",
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
    );
  }
}
