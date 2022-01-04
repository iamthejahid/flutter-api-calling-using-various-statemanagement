import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_scratch/backend/api_services.dart';
import 'package:getx_scratch/screen/first_page.dart';
import 'package:getx_scratch/screen/second_page.dart';
import 'package:getx_scratch/screen/third_page.dart';

class HomePage extends GetView<ApiServices> {
  const HomePage({Key? key}) : super(key: key);

  void _goToFirst() => Get.to(() => const FirstPage());

  void _goToSecond() => Get.to(() => const SecondPage());

  void _goToThird() => Get.to(() => const ThirdPage());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
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
                onPressed: _goToFirst,
                child: const Text(
                  "Go to First Page",
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
