import 'package:kandangapp/models/katalog_response_model.dart';
import 'package:kandangapp/src/resources/networking/api_base_helper.dart';

class KatalogProvider {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<KatalogResponseModel> getListKatalog() async {   

    final response = await _helper.get("/api/katalogs?start=0&limit=10");
    //print('Katalog_response: '+response.toString());
    return KatalogResponseModel.fromJson(response);
  }

}
