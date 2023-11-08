import 'package:flutter/material.dart';
import 'package:livenews/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mews Apk',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen

      ),
    );
  }
}
