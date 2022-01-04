import 'package:api_boiler_plate/backend/ap_response_model/basic_get_model.dart';
import 'package:api_boiler_plate/backend/api_services.dart';
import 'package:api_boiler_plate/custom/loader/loading_overlay.dart';
import 'package:flutter/widgets.dart';

class HomePageProvider with ChangeNotifier {
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
  // bool _isLoading = false;

  BasicGet get basicGet => _basicGet;

  void getData(context) async {
    // _basicGet = await ApiServices.basicGetOperation();
    await LoadingOverlay.of(context)
        .during(ApiServices.basicGetOperation())
        .then((value) => _basicGet = value);
    notifyListeners();
  }
}
