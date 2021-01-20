import 'package:bp_data/db/app_database.dart';
import 'package:bp_data/db/floor_db_service.dart';
import 'package:bp_data/di/network_module.dart';
import 'package:bp_data/repository/province/province_data_repository.dart';
import 'package:bp_data/source/province/local/province_local_repository_datasource.dart';
import 'package:bp_data/source/province/province_repository_datasources.dart';
import 'package:bp_data/source/province/remote/province_remote_repository_datasource.dart';
import 'package:bp_domain/repository/provice_data_repository.dart';
import 'package:riverpod/riverpod.dart';

final floorAppDatabase = Provider<FloorDbService>((ref) => FloorDbService());

final provinceRemoteDataSourceProvider = Provider<ProvinceRemoteRepoDataStore>(
    (ref) =>
        ProvinceRemoteRepositoryDataSourceImpl(ref.read(apiServiceProvider)));

final provinceLocalDataSourceProvider = Provider<ProvinceLocalRepoDataStore>(
    (ref) => ProvinceLocalRepositoryDataSourceImpl(ref.read(floorAppDatabase)));

final provinceDataRepositoryProvider = Provider<ProvinceDataRepository>((ref) =>
    ProvinceDataRepositoryImpl(ref.read(provinceRemoteDataSourceProvider),
        ref.read(provinceLocalDataSourceProvider)));
