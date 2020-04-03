import 'package:kandangapp/models/katalog_response_model.dart';
import 'package:kandangapp/src/provider/katalog_provider.dart';

class KatalogRepository {
  final KatalogProvider katalogProvider = KatalogProvider();

  Future<KatalogResponseModel> getListKatalog() => katalogProvider.getListKatalog();
}
