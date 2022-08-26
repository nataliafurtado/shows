import 'package:home/micro_app/home_dependencies.dart';
import 'package:home/micro_app/home_micro_app.dart';
import 'package:show_details/micro_app/show_details_dependencies.dart';
import 'package:show_details/micro_app/show_details_micro_app.dart';
import 'package:shows/interceptors/dio_instances.dart';
import 'package:shows/utils/constants.dart';
import 'package:shows/utils/im.dart';
import 'package:shows/utils/routes.dart';
import 'package:micro_app/micro_app.dart';

class InitMicroApps {
  InitMicroApps() {
    MicroApp.instanceManager = IM();
    initMicroApps();
  }

  List<MicroApp> microApps = [
    HomeMicroApp(
      HomeDependencies(
        baseUrl: Constants.baseUrl,
        client: DioInstances.dioClient(),
      ),
    ),
    ShowDetailsMicroApp(
      ShowDetailsDependencies(
        baseUrl: Constants.baseUrl,
        client: DioInstances.dioClient(),
      ),
    ),
  ];

  Future<void> initMicroApps() async {
    await Future.forEach(
      microApps,
      (MicroApp microApp) async {
        routes.addAll(
          await microApp.init(),
        );
      },
    );
  }
}
