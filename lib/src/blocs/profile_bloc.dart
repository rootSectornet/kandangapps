import 'package:kandangapp/models/profile_response_model.dart';
import 'package:kandangapp/repositories/profile_repository.dart';
import 'package:kandangapp/src/blocs/auth_bloc.dart';
import 'dart:async';
import 'package:kandangapp/src/resources/networking/api_response.dart';

class ProfileBloc {
  ProfileRepository _profileRepository;
  StreamController _profileController;

  StreamSink<ApiResponse<ProfileResponseModel>> get profileResponseModelSink => _profileController.sink;

  Stream<ApiResponse<ProfileResponseModel>> get profileResponseModelStream => _profileController.stream;

  ProfileBloc() {
    _profileController =StreamController<ApiResponse<ProfileResponseModel>>();
    _profileRepository = ProfileRepository();
    fetchProfile();
  }

  fetchProfile() async {
    profileResponseModelSink.add(ApiResponse.loading('Fetching Top Active Staff'));
    try {
      ProfileResponseModel profileResponseModel =await _profileRepository.getProfile();
      profileResponseModelSink.add(ApiResponse.completed(profileResponseModel));
    } catch (e) {
      profileResponseModelSink.add(ApiResponse.error(e.toString()));
    }
  }

  logout(){
    authBloc.closeSession();
  }

  dispose() {
    _profileController?.close();
  }
}