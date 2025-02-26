import 'package:flutter/material.dart';
import 'package:fyp/mobile/Pages/publishedBids/apply_page.dart';
import 'package:fyp/mobile/Pages/publishedBids/bid_now_page.dart';
import 'package:fyp/mobile/Pages/publishedBids/publishedBids.dart';
import 'package:fyp/mobile/Pages/publishedBids/view_page.dart';
import 'package:fyp/mobile/Pages/user_registration/user_registration.dart';
import 'package:fyp/mobile/Pages/home/ui/homepage.dart';
import 'package:fyp/mobile/Pages/login/login.dart';
import 'package:fyp/mobile/Pages/submittedBids/submitted_bids.dart';
import 'package:fyp/mobile/provider/applypage_provider.dart';
import 'package:fyp/mobile/provider/imageprovider.dart';
import 'package:fyp/mobile/provider/viewpage_provider.dart';
import 'package:fyp/web/provider/switch_provider.dart';
import 'package:fyp/web/views/admin_mngt.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context) => TableViewModel()), // Provide ViewModel
        ChangeNotifierProvider(create: (context) => DropdownProvider()),
        ChangeNotifierProvider(create: (context) => ImageProviderClass()),
         ChangeNotifierProvider<SwitchProvider>(create: (_)=>SwitchProvider())
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FYP',
      
        home: 
        //  LoginPage()
         //Homepage(),
         // ViewPage()
         //ApplyPage()
         AdminManagement(),

        // const SubmittedBids(),
        //BidNowPage(),
        //UserRegistration(),
        //TenderOpened(),
      ),
    );
  }
}

 
