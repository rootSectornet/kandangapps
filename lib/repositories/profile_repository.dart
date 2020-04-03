import 'package:kandangapp/models/profile_response_model.dart';
import 'package:kandangapp/src/provider/profile_provider.dart';

class ProfileRepository {
  final ProfileProvider profileProvider = ProfileProvider();

  Future<ProfileResponseModel> getProfile() => profileProvider.getProfile();
}
