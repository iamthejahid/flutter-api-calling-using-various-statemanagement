import 'package:setstate_api_calling_example/custom/global_veriables/global_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoJobsToShow extends StatelessWidget {
  final String text;
  const NoJobsToShow(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Center(
            child: Lottie.asset(
              "assets/nothing_found.json",
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: GlobalColor.loginTitle),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
