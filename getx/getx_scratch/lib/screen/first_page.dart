import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_scratch/backend/api_services.dart';
import 'package:getx_scratch/screen/home_page.dart';
import 'package:getx_scratch/screen/second_page.dart';
import 'package:getx_scratch/screen/third_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void _goToHome() => Get.to(() => const HomePage());

  void _goToSecond() => Get.to(() => const SecondPage());

  void _goToThird() => Get.to(() => const ThirdPage());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("First Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GetBuilder<ApiServices>(
                init: ApiServices(),
                builder: (_) => _.isShow
                    ? SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: _.basicGet.data!.length,
                          itemBuilder: (ctx, i) => Row(
                            children: [
                              Container(
                                height: 50,
                                width: 40,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Image.network(
                                    _.basicGet.data![i].avatar ?? ""),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_.basicGet.data![i].id.toString()),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_.basicGet.data![i].firstName ?? ""),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_.basicGet.data![i].firstName ?? " "),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_.basicGet.data![i].email ?? ""),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ),
              // Obx(() => ListView.builder(itemCount: ,itemBuilder: ) ),
              ElevatedButton(
                onPressed: () => Get.find<ApiServices>().basicGetOperation(),
                child: const Text(
                  "Get Basic Data",
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.find<ApiServices>().clearBasicData(),
                child: const Text(
                  "Clear Basic Get Data",
                ),
              ),

              ElevatedButton(
                onPressed: _goToHome,
                child: const Text(
                  "Go to Home Page",
                ),
              ),
              ElevatedButton(
                onPressed: _goToSecond,
                child: const Text(
                  "Go to Second Page",
                ),
              ),
              ElevatedButton(
                onPressed: _goToThird,
                child: const Text(
                  "Go to Third Page",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
