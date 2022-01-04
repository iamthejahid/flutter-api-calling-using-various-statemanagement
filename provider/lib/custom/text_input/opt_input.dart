import 'package:api_boiler_plate/custom/global_veriables/globalColor.dart';
import "package:flutter/material.dart";

Widget optInput({
  bool actionNext = false,
  required FormFieldSetter<String> onSaved,
  required TextEditingController controller,
  required VoidCallback onEditingComplete,
  required FocusNode focusNode,
}) {
  return Container(
    height: 60,
    width: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: SizedBox(
      height: 75,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          counterText: "",
        ),
        style: TextStyle(
          color: GlobalColor.loginTitle,
        ),
        focusNode: focusNode,
        maxLength: 1,
        onEditingComplete: onEditingComplete,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        textInputAction:
            actionNext ? TextInputAction.next : TextInputAction.done,
        keyboardType: TextInputType.number,
        onSaved: onSaved,
        controller: controller,
        onChanged: onSaved,
      ),
    ),
  );
}
