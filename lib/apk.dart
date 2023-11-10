import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livenews/homepage.dart';
import 'package:livenews/stateManager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mews Apk',
      home: HomePage(),
      initialBinding: binding(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen

      ),
    );
  }

}
class binding extends Bindings{
  void dependencies(){
    Get.put<NewsController>(NewsController());
  }
}