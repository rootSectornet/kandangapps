import 'package:kandangapp/models/kategori_response_model.dart';
import 'package:kandangapp/repositories/kategori_repository.dart';
import 'dart:async';
import 'package:kandangapp/src/resources/networking/api_response.dart';

class CategoryBloc {
  CategoryRepository _categoryRepository;
  StreamController _categoryController;

  StreamSink<ApiResponse<CategoryResponseModel>> get categoryResponseModelSink => _categoryController.sink;

  Stream<ApiResponse<CategoryResponseModel>> get categoryResponseModelStream => _categoryController.stream;

  CategoryBloc() {
    _categoryController =StreamController<ApiResponse<CategoryResponseModel>>();
    _categoryRepository = CategoryRepository();
    // fetchCategory();
  }

  fetchCategory(int id) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    categoryResponseModelSink.add(ApiResponse.loading('Fetching category'));
    try {
      CategoryResponseModel profileResponseModel =await _categoryRepository.getCategory(id);
      print('Category_response: '+profileResponseModel.message);
      categoryResponseModelSink.add(ApiResponse.completed(profileResponseModel));
    } catch (e) {
      categoryResponseModelSink.add(ApiResponse.error(e.toString()));
    }
  }

  dispose() {
    _categoryController?.close();
  }
}