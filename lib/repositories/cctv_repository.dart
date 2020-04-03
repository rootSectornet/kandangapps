import 'package:kandangapp/models/cctv_response_model.dart';
import 'package:kandangapp/src/provider/cctv_provider.dart';

class CctvRepository {
  final CctvProvider cctvProvider = CctvProvider();

  Future<CctvKandangResponseMdel> getListCctv() => cctvProvider.getListCctv();
}
