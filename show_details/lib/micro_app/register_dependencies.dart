import 'package:micro_app/micro_app.dart';
import 'package:show_details/micro_app/show_details_dependencies.dart';

Future<void> registerDependencies({
  required ShowDetailsDependencies showDetailsDependencies,
}) async {
  // MicroApp.instanceManager.registerLazySingleton<GetShowsDataSource>(
  //   () => GetShowsDataSourceImpl(
  //     baseUrl: showDetailsDependencies.baseUrl,
  //     client: showDetailsDependencies.client,
  //   ),
  // );

  // MicroApp.instanceManager.registerLazySingleton<GetShowsUseCase>(
  //   () => GetShowsUseCase(
  //     getShowsDataSource: MicroApp.instanceManager.get<GetShowsDataSource>(),
  //   ),
  // );

  // MicroApp.instanceManager.registerLazySingleton<ShowDetailsController>(
  //   () => ShowDetailsController(
  //     getShowsUseCase: MicroApp.instanceManager.get<GetShowsUseCase>(),
  //   ),
  // );
}
