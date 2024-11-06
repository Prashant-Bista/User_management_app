import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:user_management/pages/home_screen.dart';
import 'package:user_management/pages/add_user.dart';

void main() {
  databaseFactory = databaseFactoryFfi;

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
        elevatedButtonTheme:ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              textStyle: TextStyle(color: Colors.white)
            )        ) ,
        scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.purple,
        centerTitle: true,
        shadowColor: Colors.grey,
        titleTextStyle: TextStyle(fontSize: 30,color: Colors.black)
      )),
      home: HomeScreen(),
    );
  }
}
