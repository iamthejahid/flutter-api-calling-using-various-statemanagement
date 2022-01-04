import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getx_scratch/custom/global_veriables/global_color.dart';

class SimpleInputx extends StatefulWidget {
  final bool? obscureText;
  final TextEditingController controller;
  final String? label;
  final GlobalKey<FormFieldState>? formFieldKey;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldSetter<String>? onChanged;
  final bool? isTextArea;
  final bool? isRequired;
  final Icon? suffixIcon;
  final String? hintText;
  final String? initialValue;

  const SimpleInputx(
      {Key? key,
      required this.controller,
      required this.label,
      this.formFieldKey,
      this.initialValue,
      this.validator,
      this.obscureText,
      this.keyboardType,
      this.textInputAction,
      this.onChanged,
      this.isTextArea,
      this.suffixIcon,
      this.hintText,
      this.isRequired = false})
      : super(key: key);

  @override
  _SimpleInputxState createState() => _SimpleInputxState();
}

class _SimpleInputxState extends State<SimpleInputx> {
  bool? _bool;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: TextStyle(color: GlobalColor.primaryColor, fontSize: 12),
            children: [
              if (widget.isRequired ?? false)
                TextSpan(
                  text: " *",
                  style: TextStyle(color: GlobalColor.textDanger),
                )
            ],
          ),
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          // height: isTextArea == true ? 140 : 75,
          child: TextFormField(
            initialValue: widget.initialValue,
            key: widget.formFieldKey,
            minLines: widget.isTextArea == true ? 5 : 1,
            maxLines: widget.isTextArea == true ? 5 : 1,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: GlobalColor.loginSubTitle),
                suffixIcon: widget.suffixIcon,
                labelStyle:
                    TextStyle(color: GlobalColor.textGrey), // Label Name
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: GlobalColor.textGrey, width: 0.1),
                ), // focused
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: GlobalColor.textGrey, width: 0.1),
                )),
            style: TextStyle(
              color: GlobalColor.loginTitle, //Field Text
              letterSpacing: _bool == true ? 1.0 : 1.0,
            ),
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            obscureText: _bool == true ? true : false,
            controller: widget.controller,
            onChanged: widget.onChanged,
            validator: widget.validator,
            cursorColor: GlobalColor.textGrey,
          ),
        ),
      ],
    );
  }
}
