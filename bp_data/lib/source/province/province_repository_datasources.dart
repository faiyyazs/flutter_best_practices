import 'package:bp_data/entity/remote/response/province_response_entity.dart';
import 'package:retrofit/retrofit.dart';

abstract class ProvinceRemoteRepoDataStore {
  Future<HttpResponse<ProvinceResponseEntity>> getProvinces();
}

abstract class ProvinceLocalRepoDataStore {}
