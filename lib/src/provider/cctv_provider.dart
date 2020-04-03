import 'package:kandangapp/models/cctv_response_model.dart';
import 'package:kandangapp/src/resources/networking/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CctvProvider {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<CctvKandangResponseMdel> getListCctv() async {   
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, String> header = {
      "Authorization": prefs.getString("token")
    };

    final response = await _helper.get("/api/checkmypet", header: header);
    print('Cctv_response: '+response.toString());
    return CctvKandangResponseMdel.fromJson(response);
  }

}
