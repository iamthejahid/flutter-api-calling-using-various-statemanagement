import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_scratch/backend/api_services.dart';
import 'package:getx_scratch/screen/home_page.dart';

void main() {
  Get.put(ApiServices2());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertinoDialog,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
