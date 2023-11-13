import 'package:get_it/get_it.dart';

import '../../app.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  sl.registerLazySingleton<HomeController>(() => HomeController(
        storage: sl<LocalStorage>(),
      ));
  sl.registerLazySingleton<LoginController>(() => LoginController(
        repository: sl<LoginRepository>(),
      ));
}
