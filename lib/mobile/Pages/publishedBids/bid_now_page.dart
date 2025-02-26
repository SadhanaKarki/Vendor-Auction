import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class BidNowPage extends StatefulWidget {
  const BidNowPage({super.key});

  @override
  State<BidNowPage> createState() => _BidNowPageState();
}

class _BidNowPageState extends State<BidNowPage> {
  ImagePicker _picker = ImagePicker();
  XFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply Now",style: TextStyle(color: Colors.black),),),
      body: Center(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Center(
              child: Text(
                "Image not selected"
              ),
            ),

          ),
          ElevatedButton.icon(
           onPressed: () async{
             final XFile? photo= await _picker.pickImage(source: ImageSource.gallery);
             setState(() {
               file=photo;
             });
             print("Image selected");
           },
           icon: Icon(Icons.image, color: const Color.fromARGB(255, 231, 224, 224)), // Add your desired icon
           label: Text("Add Image",style: TextStyle(color: Colors.white),), 
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.all(10),
            textStyle: TextStyle(fontSize: 18),
            ),
         ),

        ],
      ),
    ),
    );
  }
}