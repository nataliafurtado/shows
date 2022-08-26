import 'package:micro_app/micro_app.dart';
import 'package:show_details/data/data_sources/get_seasons_data_source_impl.dart';
import 'package:show_details/domain/use_cases/get_seasons_use_case.dart';
import 'package:show_details/infrastructure/data_sources/get_seasons_data_source.dart';
import 'package:show_details/micro_app/show_details_dependencies.dart';
import 'package:show_details/presentation/controller/show_details_controller.dart';

Future<void> registerDependencies({
  required ShowDetailsDependencies showDetailsDependencies,
}) async {
  MicroApp.instanceManager.registerFactory<GetSeasonsDataSource>(
    () => GetSeasonsDataSourceImpl(
      baseUrl: showDetailsDependencies.baseUrl,
      client: showDetailsDependencies.client,
    ),
  );

  MicroApp.instanceManager.registerFactory<GetSeasonsUseCase>(
    () => GetSeasonsUseCase(
      getShowsDataSource: MicroApp.instanceManager.get<GetSeasonsDataSource>(),
    ),
  );

  MicroApp.instanceManager.registerLazySingleton<ShowDetailsController>(
    () => ShowDetailsController(
      getSeasonsUseCase: MicroApp.instanceManager.get<GetSeasonsUseCase>(),
    ),
  );
}
