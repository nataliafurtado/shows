library micro_app;

abstract class MicroApp {
  List<MicroAppDependencies>? dependencies;
  static late InstanceManager instanceManager;

  MicroApp({
    this.dependencies,
  });

  Future<Map<String, dynamic Function(dynamic, Object?)>> init();
}

abstract class MicroAppDependencies {}

abstract class InstanceManager {
  /// [pathToKeepInstanceAlive] - keeps the singleton alive as long as the navigation route name contains this path
  void registerLazySingleton<T extends Object>(
    T Function() register, {
    String? pathToKeepInstanceAlive,
    Function? disposingFunction,
  });

  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  });
}
