import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinders/core/data/new_remote/network_service.dart';

import 'application/authentication/repositories/auth_repo.dart';
import 'core/app_store/app_store.dart';
import 'core/data/local_data/local_data_source.dart';

final getIt = GetIt.instance;

Future<void> configureInjection() async {
  /// data sources
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final AppStore appStore = AppStore();
///repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));

  ///core
  getIt.registerLazySingleton<NetworkService>(() => DioNetworkService());

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceSharedPreferences(getIt()));

  getIt.registerLazySingleton<AppStore>(() => appStore);
}
