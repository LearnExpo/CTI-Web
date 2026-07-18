import 'package:career_transformation_institute/services/school_repository.dart';
import 'package:get_it/get_it.dart';
import '../config/env.dart';
import '../network/api_client.dart';
import '../../services/schools_mock_repository.dart';
import '../../services/schools_remote_repository.dart';

final getIt = GetIt.instance;

/// Wires up every dependency once, at app startup. This is the *only*
/// place that decides mock vs. real data — nothing else in the app
/// needs to know or care.
void setupServiceLocator() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  getIt.registerLazySingleton<SchoolsRepository>(
    () => Env.useMockData
        ? SchoolsMockRepository()
        : SchoolsRemoteRepository(getIt<ApiClient>()),
  );

  // Register future repositories the same way as you add them:
  // getIt.registerLazySingleton<PartnersRepository>(...);
  // getIt.registerLazySingleton<ContactRepository>(...);
}