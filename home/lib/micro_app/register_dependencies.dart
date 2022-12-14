import 'package:home/data/data_sources/get_shows_data_source_impl.dart';
import 'package:home/data/data_sources/search_shows_data_source_impl.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/domain/use_cases/search_shows_use_case.dart';
import 'package:home/infrastructure/data_sources/get_shows_data_source.dart';
import 'package:home/micro_app/home_dependencies.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:home/presentation/search/controller/search_controller.dart';
import 'package:micro_app/micro_app.dart';

Future<void> registerDependencies({
  required HomeDependencies homeDependencies,
}) async {
  MicroApp.instanceManager.registerFactory<GetShowsDataSource>(
    () => GetShowsDataSourceImpl(
      baseUrl: homeDependencies.baseUrl,
      client: homeDependencies.client,
    ),
  );

  MicroApp.instanceManager.registerFactory<GetShowsUseCase>(
    () => GetShowsUseCase(
      getShowsDataSource: MicroApp.instanceManager.get<GetShowsDataSource>(),
    ),
  );

  MicroApp.instanceManager.registerLazySingleton<HomeController>(
    () => HomeController(
      getShowsUseCase: MicroApp.instanceManager.get<GetShowsUseCase>(),
    ),
  );

  MicroApp.instanceManager.registerFactory<SearchShowsDataSourceImpl>(
    () => SearchShowsDataSourceImpl(
      baseUrl: homeDependencies.baseUrl,
      client: homeDependencies.client,
    ),
  );

  MicroApp.instanceManager.registerFactory<SearchShowsUseCase>(
    () => SearchShowsUseCase(
      searchShowsDataSource:
          MicroApp.instanceManager.get<SearchShowsDataSourceImpl>(),
    ),
  );

  MicroApp.instanceManager.registerLazySingleton<SearchController>(
    () => SearchController(
      searchShowsUseCase: MicroApp.instanceManager.get<SearchShowsUseCase>(),
    ),
    pathToKeepInstanceAlive: '/search_page',
  );
}
