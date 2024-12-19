import 'package:flutter/material.dart';
import 'package:fyp/Pages/TendeOpened/bid_now_page.dart';
import 'package:fyp/Pages/TendeOpened/tender_opened.dart';
import 'package:fyp/Pages/user_registration/user_registration.dart';
import 'package:fyp/Pages/home/ui/homepage.dart';
import 'package:fyp/Pages/login/login.dart';
import 'package:fyp/Pages/submittedBids/submitted_bids.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FYP',

      home: 
      //  LoginPage()
      const Homepage(),
      // const SubmittedBids(),
      //BidNowPage(),
      //UserRegistration(),
      //TenderOpened(),
    );
  }
}

 
