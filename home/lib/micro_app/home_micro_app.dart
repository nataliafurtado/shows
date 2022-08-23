import 'package:home/micro_app/home_dependencies.dart';
import 'package:home/micro_app/home_routes.dart';
import 'package:home/micro_app/register_dependencies.dart';
import 'package:micro_app/micro_app.dart';

class HomeMicroApp extends MicroApp {
  final HomeDependencies homeDependencies;
  HomeMicroApp(
    this.homeDependencies,
  );

  @override
  Future<Map<String, dynamic Function(dynamic, Object?)>> init() async {
    registerDependencies(
      homeDependencies: homeDependencies,
    );
    return homeRoutes;
  }
}
