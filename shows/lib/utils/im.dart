import 'package:packages/exports.dart';
import 'package:micro_app/micro_app.dart';

class IM extends InstanceManager {
  static List<Singletons> singletons = [];
  List<String> pages = [];

  @override
  void registerLazySingleton<T extends Object>(
    T Function() register, {
    Function? disposingFunction,
    String? pathToKeepInstanceAlive,
  }) {
    if (pathToKeepInstanceAlive != null) {
      singletons.add(
        Singletons<T>(
          path: pathToKeepInstanceAlive,
          disposingFunction: disposingFunction,
        ),
      );
    }
    GetIt.I.registerLazySingleton<T>(register);
  }

  void loadPagePath(String pagePath) {
    pages.add(pagePath);
  }

  void resetInstances(String currentPath) {
    pages.remove(currentPath);
    if (canClose(currentPath)) {
      resetSingletons(currentPath);
    }
  }

  void resetSingletons(currentPath) {
    final allSingletonsWithCurrentPath =
        getAllSingletonsWithCurrentPath(currentPath);
    for (var pathSingleton in allSingletonsWithCurrentPath) {
      pathSingleton.resetSingleton(
        pathSingleton.getInstance(),
        disposingFunction: pathSingleton.disposingFunction,
      );
    }
  }

  List<Singletons<dynamic>> getAllSingletonsWithCurrentPath(currentPath) =>
      singletons
          .where(
            (pathSIngleton) => pathSIngleton.path == currentPath,
          )
          .toList();

  bool canClose(currentPath) {
    final otherPathsStillUsing = pages.firstWhere(
      (pagePath) => pagePath.contains(currentPath),
      orElse: () => '',
    );
    if (otherPathsStillUsing == '') {
      return true;
    }
    return false;
  }

  @override
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return GetIt.I.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }
}

class Singletons<T extends Object> {
  final String? path;
  final Function? disposingFunction;
  Singletons({
    this.disposingFunction,
    this.path,
  });
  T getInstance() {
    return GetIt.I.get<T>();
  }

  void resetSingleton(Object instance, {Function? disposingFunction}) {
    GetIt.I.resetLazySingleton<T>(
      instance: instance,
      disposingFunction: (controller) {
        disposingFunction?.call(controller);
      },
    );
  }
}
