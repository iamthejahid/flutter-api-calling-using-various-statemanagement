// ignore_for_file: avoid_print

import 'package:setstate_api_calling_example/backend/ap_response_model/basic_get_model.dart';
import 'package:setstate_api_calling_example/backend/api_method.dart';
import 'package:setstate_api_calling_example/backend/api_urls.dart';
import 'package:setstate_api_calling_example/custom/toast_message.dart';

class ApiServices {
  static Future<BasicGet> basicGetOperation() async {
    print(ApiUrls.baseUrl);
    Map<String, dynamic> mapResponse =
        await ApiMethod().get(ApiUrls.getOperation);
    if (mapResponse.isNotEmpty) {
      BasicGet _basicGet = BasicGet.fromJson(mapResponse);
      return _basicGet;
    } else {
      ToastMessage.error("Something Went Wrong");
      throw Exception();
    }
  }
}
