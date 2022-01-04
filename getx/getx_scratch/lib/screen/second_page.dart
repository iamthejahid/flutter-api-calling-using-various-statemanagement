import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_scratch/backend/api_services.dart';
import 'package:getx_scratch/screen/home_page.dart';
import 'package:getx_scratch/screen/third_page.dart';
import 'package:getx_scratch/screen/first_page.dart';

class SecondPage extends GetView<ApiServices2> {
  const SecondPage({Key? key}) : super(key: key);

  void _goToHome() => Get.to(() => const HomePage());

  void _goToFirst() => Get.to(() => const FirstPage());

  void _goToThird() => Get.to(() => const ThirdPage());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Obx(() {
                if (controller.isShow2.value) {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: controller.basicGet2.value.data!.length,
                      itemBuilder: (ctx, i) => Row(
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Image.network(
                                controller.basicGet2.value.data![i].avatar ??
                                    ""),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(controller.basicGet2.value.data![i].id
                              .toString()),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(controller.basicGet2.value.data![i].firstName ??
                              ""),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(controller.basicGet2.value.data![i].firstName ??
                              " "),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(controller.basicGet2.value.data![i].email ?? ""),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Container();
              }),
              ElevatedButton(
                onPressed: () => Get.find<ApiServices2>().basicGet2(),
                child: const Text(
                  "Basic Get 2",
                ),
              ),
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
