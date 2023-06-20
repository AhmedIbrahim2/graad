import 'dart:io';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: Service(),
  ));
}

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturing Images'),
        backgroundColor:Color(0xFF7165D6),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageFile != null)
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 157, 152, 200),
                  image: DecorationImage(
                      image: FileImage(imageFile!), fit: BoxFit.cover),
                  border: Border.all(width: 8, color:  Color(0xFF7165D6)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )
            else
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(width: 8, color: Color.fromARGB(255, 157, 152, 200)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  'Image should appear here',
                  style: TextStyle(fontSize: 26 , color:  Color(0xFF7165D6) ,fontWeight: FontWeight.bold ),
                ),
              ),
            const SizedBox(height: 20,),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                 color: Color.fromARGB(255, 157, 152, 200),
                 borderRadius: BorderRadius.circular(10),
                 child: InkWell(
                  child: ElevatedButton(
                  onPressed: () => getImage(source: ImageSource.gallery),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF7165D6)),
                     child: Text( "Capture Image",
                      style: TextStyle(fontSize: 18 ,
                      color: Colors.white,
                      ),
                     ),
                  
                 ),
                 
                ),
            ),
            Material(
                 color: Color.fromARGB(255, 157, 152, 200),
                 borderRadius: BorderRadius.circular(10),
                 child: ElevatedButton(
                  onPressed: () => getImage(source: ImageSource.gallery),
                  style: ElevatedButton.styleFrom(
                    primary:  Color(0xFF7165D6)),
            
                     child: Text(
                      "Select Image",
                      style: TextStyle(fontSize: 18 ,
                      color: Color.fromARGB(255, 255, 255, 255)
                      ),
                     ),
                  ),
                 ),
                 
                
            
            
          ],
        ),
          ],
      ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 100 //0 - 100
        );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}