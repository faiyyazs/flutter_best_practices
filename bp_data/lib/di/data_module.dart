import 'package:bp_data/di/network_module.dart';
import 'package:bp_data/repository/province/province_data_repository.dart';
import 'package:bp_data/source/province/province_repository_datasources.dart';
import 'package:bp_data/source/province/remote/province_remote_repository_datasource.dart';
import 'package:bp_domain/repository/provice_data_repository.dart';
import 'package:riverpod/riverpod.dart';

final provinceRemoteDataSourceProvider = Provider<ProvinceRemoteRepoDataStore>(
    (ref) =>
        ProvinceRemoteRepositoryDataSourceImpl(ref.read(apiServiceProvider)));

final provinceDataRepositoryProvider = Provider<ProvinceDataRepository>((ref) =>
    ProvinceDataRepositoryImpl(ref.read(provinceRemoteDataSourceProvider)));
