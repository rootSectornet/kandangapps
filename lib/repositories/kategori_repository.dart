import 'package:kandangapp/models/kategori_response_model.dart';
import 'package:kandangapp/src/provider/kategori_provider.dart';

class CategoryRepository {
  final CategoryProvider categoryProvider = CategoryProvider();

  Future<CategoryResponseModel> getCategory(int id) => categoryProvider.getCategory(id);
}
