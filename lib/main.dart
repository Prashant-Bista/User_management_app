import 'package:flutter/material.dart';
import 'package:user_management/pages/home_screen.dart';
import 'package:user_management/pages/add_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"User Management App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.purple,
        centerTitle: true,
        shadowColor: Colors.grey,
        titleTextStyle: TextStyle(fontSize: 30,color: Colors.black)
      )),
      home: AddUser(),
    );
  }
}
