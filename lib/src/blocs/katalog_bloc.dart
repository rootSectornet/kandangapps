import 'dart:async';

import 'package:kandangapp/models/katalog_response_model.dart';
import 'package:kandangapp/repositories/katalog_repository.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';

class KatalogBloc {
  KatalogRepository _katalogRepository;
  StreamController _katalogController;

  StreamSink<ApiResponse<KatalogResponseModel>> get katalogResponseModelSink => _katalogController.sink;

  Stream<ApiResponse<KatalogResponseModel>> get katalogResponseModelStream => _katalogController.stream;

  KatalogBloc() {
    _katalogController =StreamController<ApiResponse<KatalogResponseModel>>();
    _katalogRepository = KatalogRepository();
    fetchKatalog();
  }

  fetchKatalog() async {
    katalogResponseModelSink.add(ApiResponse.loading('Fetching catalogue'));
    try {
      KatalogResponseModel katalogResponseModel =await _katalogRepository.getListKatalog();
      katalogResponseModelSink.add(ApiResponse.completed(katalogResponseModel));
    } catch (e) {
      katalogResponseModelSink.add(ApiResponse.error(e.toString()));
    }
  }

  dispose() {
    _katalogController?.close();
  }
}