import 'package:flutter/material.dart';
import 'package:tobuy_app/screen/to_buy_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF673AB7),
        accentColor: Color(0xFFD1C4E9),
        iconTheme: IconThemeData(size: 35.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ToBuyScreen(),
    );
  }
}
