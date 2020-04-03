import 'dart:async';

import 'package:kandangapp/models/cctv_response_model.dart';
import 'package:kandangapp/repositories/cctv_repository.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';

class CctvBloc {
  CctvRepository _cctvRepository;
  StreamController _cctvController;

  StreamSink<ApiResponse<CctvKandangResponseMdel>> get cctvResponseModelSink => _cctvController.sink;

  Stream<ApiResponse<CctvKandangResponseMdel>> get cctvResponseModelStream => _cctvController.stream;

  CctvBloc() {
    _cctvController =StreamController<ApiResponse<CctvKandangResponseMdel>>();
    _cctvRepository = CctvRepository();
    fetchCctvList();
  }

  fetchCctvList() async {
    cctvResponseModelSink.add(ApiResponse.loading('Fetching cctv'));
    try {
      CctvKandangResponseMdel cctvResponseModel =await _cctvRepository.getListCctv();
      cctvResponseModelSink.add(ApiResponse.completed(cctvResponseModel));
    } catch (e) {
      cctvResponseModelSink.add(ApiResponse.error(e.toString()));
    }
  }

  dispose() {
    _cctvController?.close();
  }
}