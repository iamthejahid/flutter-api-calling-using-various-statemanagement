import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:api_boiler_plate/screen/second_page.dart';
import 'package:api_boiler_plate/providers/homepageProvider.dart';
import 'package:api_boiler_plate/custom/buttons/custom_buttons.dart';
import 'package:api_boiler_plate/custom/global_veriables/global_duration.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // var _basicGet;
  // bool _showText = false;
  // BasicGet getModel = BasicGet();

  late HomePageProvider _getModel;

  @override
  void initState() {
    super.initState();
    _getModel = Provider.of<HomePageProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SubmitButton(
              onPressed: () => Future.delayed(GlobalDuration.apiDuration, () {
                _getModel.getData(context);
                setState(() {});
              }),
              childText: true,
              childIcon: false,
              childTextString: "Get Operation",
            ),
            Center(
              child: Container(
                height: 200,
                child: ListView.builder(
                  itemCount: _getModel.basicGet.data!.length,
                  itemBuilder: (context, i) => Row(
                    children: [
                      Container(
                        height: 50,
                        width: 39,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                            _getModel.basicGet.data![i].avatar ?? ""),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(_getModel.basicGet.data![i].id.toString()),
                      SizedBox(
                        width: 10,
                      ),
                      Text(_getModel.basicGet.data![i].firstName ?? ""),
                      SizedBox(
                        width: 10,
                      ),
                      Text(_getModel.basicGet.data![i].firstName ?? " "),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 500,
              child: SubmitButton(
                onPressed: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SecondPage())),
                childText: true,
                childIcon: false,
                childTextString: 'Second Page',
              ),
            )
          ],
        ),
      ),
    );
  }
}
