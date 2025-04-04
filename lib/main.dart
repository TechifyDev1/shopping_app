import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import './home_page.dart';
import './product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Geist",
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(254, 206, 1, 1),
          primary: Color.fromRGBO(254, 206, 1, 1),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      title: "Shopping app",
      home: HomePage(),

      debugShowCheckedModeBanner: false,
    );
  }
}
