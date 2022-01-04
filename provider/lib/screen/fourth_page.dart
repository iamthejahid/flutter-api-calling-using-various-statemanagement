import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  FourthPage({Key? key}) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Page"),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
