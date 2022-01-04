import 'package:api_boiler_plate/backend/ap_response_model/basic_get_model.dart';
import 'package:api_boiler_plate/backend/api_method.dart';
import 'package:api_boiler_plate/backend/api_urls.dart';
import 'package:api_boiler_plate/custom/toast_message.dart';

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
