import 'package:kandangapp/models/kategori_response_model.dart';
import 'package:kandangapp/src/resources/networking/api_base_helper.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider {
  ApiBaseHelper _helper = ApiBaseHelper();
  
  Future<CategoryResponseModel> getCategory(int id) async {   
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    // Map<String, String> header = {
    //   "Authorization": prefs.getString("token")
    // };

    final response = await _helper.get("/api/category/?start=0&limit=10&place_id=" + id.toString());
    print('Category_response: '+response.toString());
    return CategoryResponseModel.fromJson(response);
  }

}
