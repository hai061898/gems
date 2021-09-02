import 'package:flutter/material.dart';
import 'package:gems/pages/menu/menu_screen.dart';
import 'package:gems/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gems',
      theme: themeData(),
      home: MenuScreen(),
      
    );
  }
}