import 'package:api_boiler_plate/backend/api_services.dart';
import 'package:api_boiler_plate/custom/buttons/custom_buttons.dart';
import 'package:api_boiler_plate/custom/loader/loading_overlay.dart';
import 'package:api_boiler_plate/custom/toast_message.dart';
import 'package:api_boiler_plate/screen/fourth_page.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      body: Container(
        child: Column(
          children: [
            SubmitButton(
              onPressed: () {
                LoadingOverlay.of(context)
                    .during(ApiServices.basicGetOperation())
                    .then((value) => value.data!.length != 0
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FourthPage()))
                        : ToastMessage.error("Some Problems Occured"));
              },
              childText: true,
              childIcon: false,
              childTextString: 'Push to Page 4 after operation',
            )
          ],
        ),
      ),
    );
  }
}
