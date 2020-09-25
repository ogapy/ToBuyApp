import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobuy_app/models/item_data.dart';
import 'package:tobuy_app/screens/to_buy_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFF673AB7),
          accentColor: Color(0xFFD1C4E9),
          iconTheme: IconThemeData(size: 35.0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ToBuyScreen(),
      ),
    );
  }
}
