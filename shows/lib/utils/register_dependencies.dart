import 'package:packages/exports.dart';
import 'package:shows/interceptors/dio_instances.dart';
import 'package:shows/interceptors/dio_interceptor.dart';
import 'package:shows/utils/im.dart';
import 'package:shows/utils/init_micro_apps.dart';

Future<void> registerDependencies() async {
  GetIt.I.registerLazySingleton<IM>(
    () => IM(),
  );

  GetIt.I.registerLazySingleton<DioInterceptor>(
    () => DioInterceptor(),
  );

  DioInstances.dioClient().interceptors.add(
        GetIt.I.get<DioInterceptor>(),
      );

  GetIt.I.registerSingleton<InitMicroApps>(
    InitMicroApps(),
  );
}
