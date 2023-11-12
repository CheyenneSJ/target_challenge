import 'package:get_it/get_it.dart';

import '../../app.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // sl.registerLazySingleton<CustomDio>(() => CustomDio());
  sl.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());
  sl.registerLazySingleton<HomeController>(
      () => HomeController(storage: sl<LocalStorage>()));
}
