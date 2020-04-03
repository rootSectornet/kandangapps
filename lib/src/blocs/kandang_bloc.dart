import 'dart:async';

import 'package:kandangapp/models/kandang_response_model.dart';
import 'package:kandangapp/repositories/kandang_repository.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';

class KandangBloc {
  KandangRepository _kandangRepository;
  StreamController _kandangController;

  StreamSink<ApiResponse<KandangResponseModel>> get kandangResponseModelSink => _kandangController.sink;

  Stream<ApiResponse<KandangResponseModel>> get kandangResponseModelStream => _kandangController.stream;

  KandangBloc() {
    _kandangController =StreamController<ApiResponse<KandangResponseModel>>();
    _kandangRepository = KandangRepository();
    fetchKandangList();
  }

  fetchKandangList() async {
    kandangResponseModelSink.add(ApiResponse.loading('Fetching Top Active Staff'));
    try {
      KandangResponseModel kandangResponseModel =await _kandangRepository.getListKandang();
      kandangResponseModelSink.add(ApiResponse.completed(kandangResponseModel));
    } catch (e) {
      kandangResponseModelSink.add(ApiResponse.error(e.toString()));
    }
  }

  dispose() {
    _kandangController?.close();
  }
}