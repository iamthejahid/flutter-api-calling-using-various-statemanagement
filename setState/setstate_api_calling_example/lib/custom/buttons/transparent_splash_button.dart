import 'dart:async';
import 'package:setstate_api_calling_example/custom/global_veriables/global_color.dart';
import 'package:setstate_api_calling_example/custom/global_veriables/global_duration.dart';
import 'package:flutter/material.dart';

class TransparentSplashButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double height;
  final Color borderColor;
  final Color titleColor;
  const TransparentSplashButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.height = 35,
    this.borderColor = const Color(0xFF0675c1),
    this.titleColor = const Color(0xFF0675c1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: borderColor,
              width: .8,
            ),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: titleColor,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: GlobalColor.primaryColor.withOpacity(0.5),
              splashFactory: InkRipple.splashFactory,
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18.0),
                ),
              ),
              onTap: () => Timer(
                GlobalDuration.inkSplashDuration,
                onPressed,
              ),
            ),
          ),
        )
      ],
    );
  }
}
