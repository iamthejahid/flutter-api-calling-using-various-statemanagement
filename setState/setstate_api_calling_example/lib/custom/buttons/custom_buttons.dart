import "package:flutter/material.dart";
import 'package:flutter_bounce/flutter_bounce.dart';

import 'package:setstate_api_calling_example/custom/global_veriables/global_duration.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.onPressed,
    required this.childText,
    this.childTextString,
    required this.childIcon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool childText;
  final String? childTextString;
  final bool childIcon;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 20, 5),
        child: Bounce(
          duration: GlobalDuration.bounceDuration,
          onPressed: onPressed,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF6ba7cf), Color(0xFF0675c1)]),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (childText)
                  Text(
                    childTextString ?? "ADD",
                    style: const TextStyle(color: Colors.white),
                  ),
                if (childIcon)
                  const Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ),
      );
}
