import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:getx_scratch/backend/api_urls.dart';
import 'package:getx_scratch/backend/api_method.dart';
import 'package:getx_scratch/custom/toast_message.dart';
import 'package:getx_scratch/backend/ap_response_model/basic_get_model.dart';

class ApiServices extends GetxController {
  bool isShow = false;
  BasicGet basicGet = BasicGet();
  void basicGetOperation() async {
    debugPrint(ApiUrls.baseUrl);
    Map<String, dynamic> mapResponse =
        await ApiMethod().get(ApiUrls.getOperation);
    if (mapResponse.isNotEmpty) {
      basicGet = BasicGet.fromJson(mapResponse);

      isShow = true;

      update();
    } else {
      ToastMessage.error("Something Went Wrong");
      throw Exception();
    }
  }

  void clearBasicData() {
    basicGet = BasicGet();
    isShow = false;
    update();
  }
}

class ApiServices2 extends GetxController {
  var isShow2 = false.obs;
  var basicGet2 = BasicGet(data: []).obs;

  @override
  void onInit() {
    basicGetOperation2();
    super.onInit();
  }

  void basicGetOperation2() async {
    debugPrint(ApiUrls.baseUrl);
    Map<String, dynamic> mapResponse =
        await ApiMethod().get(ApiUrls.getOperation2);
    if (mapResponse.isNotEmpty) {
      basicGet2 = BasicGet.fromJson(mapResponse).obs;

      isShow2 = true.obs;

      update();
    } else {
      ToastMessage.error("Something Went Wrong");
      throw Exception();
    }
  }

  void clearBasicData2() {
    basicGet2 = BasicGet().obs;
    isShow2 = false.obs;
  }
}

class ApiServices3 extends GetxController {
  var isShow3 = false.obs;
  var basicGet3 = BasicGet(data: []).obs;

  @override
  void onInit() {
    basicGetOperation3();
    super.onInit();
  }

  void basicGetOperation3() async {
    debugPrint(ApiUrls.baseUrl);
    Map<String, dynamic> mapResponse =
        await ApiMethod().get(ApiUrls.getOperation3);
    if (mapResponse.isNotEmpty) {
      basicGet3 = BasicGet.fromJson(mapResponse).obs;

      isShow3 = true.obs;

      update();
    } else {
      ToastMessage.error("Something Went Wrong");
      throw Exception();
    }
  }

  void clearBasicData3() {
    basicGet3 = BasicGet().obs;

    isShow3 = false.obs;
  }
}
