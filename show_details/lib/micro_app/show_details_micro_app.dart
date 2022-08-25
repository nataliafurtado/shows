import 'package:micro_app/micro_app.dart';
import 'package:show_details/micro_app/register_dependencies.dart';
import 'package:show_details/micro_app/show_details_dependencies.dart';
import 'package:show_details/micro_app/show_details_routes.dart';

class ShowDetailsMicroApp extends MicroApp {
  final ShowDetailsDependencies showDetailsDependencies;
  ShowDetailsMicroApp(
    this.showDetailsDependencies,
  );

  @override
  Future<Map<String, dynamic Function(dynamic, Object?)>> init() async {
    registerDependencies(
      showDetailsDependencies: showDetailsDependencies,
    );
    return showDetailsRoutes;
  }
}
