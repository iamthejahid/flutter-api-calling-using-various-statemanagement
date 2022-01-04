import 'package:api_boiler_plate/backend/ap_response_model/basic_get_model.dart';
import 'package:api_boiler_plate/backend/api_services.dart';
import 'package:api_boiler_plate/custom/buttons/custom_buttons.dart';
import 'package:api_boiler_plate/custom/global_veriables/global_duration.dart';
import 'package:api_boiler_plate/custom/loader/loading_overlay.dart';
import 'package:api_boiler_plate/screen/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  BasicGet _basicGet = BasicGet(
    page: 0,
    perPage: 0,
    total: 0,
    totalPages: 0,
    data: [],
    support: Support(
      text: "",
      url: "",
    ),
  );
  // var _basicGet;
  bool _showText = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SubmitButton(
              onPressed: () => Future.delayed(
                GlobalDuration.apiDuration,
                () => LoadingOverlay.of(context)
                    .during(ApiServices.basicGetOperation())
                    .then(
                      (value) => setState(
                        () {
                          _basicGet = value;
                          _showText = true;
                        },
                      ),
                    ),
              ),
              childText: true,
              childIcon: false,
              childTextString: "Get Operation",
            ),
            if (_showText)
              Center(
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: _basicGet.data!.length,
                    itemBuilder: (context, i) => Row(
                      children: [
                        Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(_basicGet.data![i].avatar ?? ""),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(_basicGet.data![i].id.toString()),
                        SizedBox(
                          width: 10,
                        ),
                        Text(_basicGet.data![i].firstName ?? ""),
                        SizedBox(
                          width: 10,
                        ),
                        Text(_basicGet.data![i].firstName ?? " "),
                        SizedBox(
                          width: 10,
                        ),
                        Text(_basicGet.data![i].email ?? ""),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (_showText)
              SubmitButton(
                onPressed: () => setState(() {
                  _basicGet.data = <BasicGetData>[];
                  _showText = false;
                }),
                childText: true,
                childIcon: false,
                childTextString: "Reset",
              ),
            Container(
              width: 200,
              child: SubmitButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdPage())),
                childText: true,
                childIcon: false,
                childTextString: 'Third Page',
              ),
            )
          ],
        ),
      ),
    );
  }
}
