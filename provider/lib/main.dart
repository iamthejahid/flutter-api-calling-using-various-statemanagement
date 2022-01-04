import 'package:api_boiler_plate/providers/homepageProvider.dart';
import 'package:api_boiler_plate/screen/first_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MultiProvider(
    providers: _providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

//Now I will Try to Upgrade the Project to Provider State Managemetn Condition

List<SingleChildWidget> _providers = [
  ChangeNotifierProvider(
    create: (_) => HomePageProvider(),
  ),
];
