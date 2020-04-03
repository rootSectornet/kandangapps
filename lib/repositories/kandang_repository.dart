import 'package:kandangapp/models/kandang_response_model.dart';
import 'package:kandangapp/src/provider/kandang_provider.dart';

class KandangRepository {
  final KandangProvider kandangProvider = KandangProvider();

  Future<KandangResponseModel> getListKandang() => kandangProvider.getListKandang();
}
