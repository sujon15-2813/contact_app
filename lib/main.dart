import 'package:flutter/material.dart';
import 'package:flutter_contactapp/pages.dart/contact_details_page.dart';
import 'package:flutter_contactapp/pages.dart/contact_home_page.dart';
import 'package:flutter_contactapp/pages.dart/new_contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.red,
      ),
      initialRoute:ContatctHomePage.routeName ,
      routes: {
        ContatctHomePage.routeName :(context) => ContatctHomePage(),
        NewContactPage.routeName :(context) =>   NewContactPage(),
        ContactDetailsPage.routeName :(context) =>  ContactDetailsPage(),


      },
      
      
    );
  }
}

