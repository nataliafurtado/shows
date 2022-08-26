import 'package:micro_app/micro_app.dart';

class InstanceManagerMock extends InstanceManager {
  Map<String, Function> dependencies = {};

  @override
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return dependencies[T.toString()]!();
  }

  @override
  void registerLazySingleton<T extends Object>(
    T Function() register, {
    String? pathToKeepInstanceAlive,
    Function? disposingFunction,
  }) {
    dependencies.addAll({T.toString(): register});
  }

  @override
  void registerFactory<T extends Object>(T Function() factoryFunc,
      {String? instanceName}) {}
}
