import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_scratch/backend/api_services.dart';
import 'package:getx_scratch/screen/first_page.dart';
import 'package:getx_scratch/screen/home_page.dart';
import 'package:getx_scratch/screen/second_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  void _goToHome() => Get.to(() => const HomePage());

  void _goToFirst() => Get.to(() => const FirstPage());

  void _goToSecond() => Get.to(() => const SecondPage());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Third Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GetBuilder<ApiServices3>(
                init: ApiServices3(),
                // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
                builder: (_) => _.isShow3.value
                    ? SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: _.basicGet3.value.data!.length,
                          itemBuilder: (ctx, i) => Row(
                            children: [
                              Container(
                                height: 50,
                                width: 40,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Image.network(
                                    _.basicGet3.value.data![i].avatar ?? ""),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_.basicGet3.value.data![i].id.toString()),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_.basicGet3.value.data![i].firstName ?? ""),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_.basicGet3.value.data![i].firstName ?? " "),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_.basicGet3.value.data![i].email ?? ""),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ),
              // Here this will Created while Opening page, will remove after if we close the app!
              ElevatedButton(
                onPressed: _goToHome,
                child: const Text(
                  "Go to Home Page",
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
            ],
          ),
        ),
      ),
    );
  }
}
