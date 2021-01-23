import 'package:bp_data/di/data_module.dart';
import 'package:bp_domain/usecase/fetch_jobs_usecase.dart';
import 'package:bp_domain/usecase/fetch_province.dart';
import 'package:bp_domain/usecase/fetch_update_province.dart';
import 'package:riverpod/riverpod.dart';

final provinceFetchUseCase = Provider<FetchProvinceUseCase>(
  (ref) => FetchProvinceUseCase(
    ref.read(provinceDataRepositoryProvider),
  ),
);

final provinceFetchAndUpdateUseCase = Provider<FetchUpdateProvinceUseCase>(
  (ref) => FetchUpdateProvinceUseCase(
    ref.read(provinceDataRepositoryProvider),
  ),
);

final fetchJobUseCaseProvider = Provider<FetchJobUseCase>(
  (ref) => FetchJobUseCase(
    ref.read(jobDataRepositoryProvider),
  ),
);
