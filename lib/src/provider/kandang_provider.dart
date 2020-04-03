import 'package:kandangapp/models/kandang_response_model.dart';
import 'package:kandangapp/src/resources/networking/api_base_helper.dart';

class KandangProvider {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<KandangResponseModel> getListKandang() async {   

    final response = await _helper.get("/api/places?start=0&limit=10");
    print('Kandang_response: '+response.toString());
    return KandangResponseModel.fromJson(response);
  }

}
