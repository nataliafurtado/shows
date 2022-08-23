import 'package:entities/shows/alias.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:micro_app/instance_manager_mock.dart';
import 'package:micro_app/micro_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../home/home_page_test.mocks.dart';

@GenerateMocks([
  GetShowsUseCase,
])
void main() {
  late GetShowsUseCase createAliasUseCase;
  late HomeController homeController;

  setUp(
    () {
      MicroApp.instanceManager = InstanceManagerMock();
      createAliasUseCase = MockCreateAliasUseCase();
      homeController = HomeController(
        getShowsUseCase: createAliasUseCase,
      );
    },
  );

  tearDown(
    () async {
      homeController.aliases.value = [];
    },
  );

  const String url = 'www.g1.com.br';
  const String testOriginal = 'testOriginal';
  const String testShort = 'testShort';

  const alias = Alias(
    originalURL: testOriginal,
    shortURL: testShort,
  );

  test(
    'Should createAlias method load aliases list',
    () async {
      when(
        createAliasUseCase(
          url: url,
        ),
      ).thenAnswer(
        (_) => Future.value(
          alias,
        ),
      );
      await homeController.getShows(url);
      expect(
        homeController.aliases.value,
        [alias],
      );
      expect(
        homeController.homePageState.value,
        HomePageState.success,
      );
    },
  );

  test(
    'Should homePageState be HomePageState.error if createAliasUseCase throws exception',
    () async {
      when(
        createAliasUseCase(
          url: url,
        ),
      ).thenThrow(
        Exception(),
      );
      await homeController.getShows(url);

      expect(
        homeController.homePageState.value,
        HomePageState.error,
      );
    },
  );

  test(
    'Should homePageState be HomePageState.success if changeToSuccessWidget is called',
    () async {
      homeController.homePageState.value = HomePageState.error;
      await homeController.changeToSuccessWidget();

      expect(
        homeController.homePageState.value,
        HomePageState.success,
      );
    },
  );
}
