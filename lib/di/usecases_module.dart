import 'package:bp_data/di/data_module.dart';
import 'package:bp_domain/usecase/fetch_province.dart';
import 'package:riverpod/riverpod.dart';

final provinceFetchUseCase = Provider<FetchProvinceUseCase>(
    (ref) => FetchProvinceUseCase(ref.read(provinceDataRepositoryProvider)));
