import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:setstate_api_calling_example/backend/ap_response_model/basic_get_model.dart';
import 'package:setstate_api_calling_example/backend/api_services.dart';
import 'package:setstate_api_calling_example/custom/buttons/custom_buttons.dart';
import 'package:setstate_api_calling_example/custom/global_veriables/global_duration.dart';
import 'package:setstate_api_calling_example/custom/loader/loading_overlay.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

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
        title: const Text("Second Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
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
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: _basicGet.data!.length,
                    itemBuilder: (context, i) => Row(
                      children: [
                        Container(
                          height: 50,
                          width: 40,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(_basicGet.data![i].avatar ?? ""),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(_basicGet.data![i].id.toString()),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(_basicGet.data![i].firstName ?? ""),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(_basicGet.data![i].firstName ?? " "),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(_basicGet.data![i].email ?? ""),
                        const SizedBox(
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
              )
          ],
        ),
      ),
    );
  }
}
