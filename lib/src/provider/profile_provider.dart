import 'package:kandangapp/models/profile_response_model.dart';
import 'package:kandangapp/src/resources/networking/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider {
  ApiBaseHelper _helper = ApiBaseHelper();
  
  Future<ProfileResponseModel> getProfile() async {   
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, String> header = {
      "Authorization": prefs.getString("token")
    };

    final response = await _helper.get("/api/myprofile", header: header);
    print('Profile_response: '+prefs.getString("token"));
    return ProfileResponseModel.fromJson(response);
  }

}
