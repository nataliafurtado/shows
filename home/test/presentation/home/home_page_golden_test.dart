import 'package:design_system/theme_style.dart';
import 'package:design_system/utils/default_theme.dart';
import 'package:entities/shows/alias.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:home/presentation/home/home_page.dart';
import 'package:micro_app/instance_manager_mock.dart';
import 'package:micro_app/micro_app.dart';

import 'home_page_test.mocks.dart';

void main() {
  late GetShowsUseCase createAliasUseCase;
  late HomeController homeController;

  const String testOriginal = 'testOriginal';
  const String testShort = 'testShort';

  final aliases = [
    const Alias(
      originalURL: testOriginal,
      shortURL: testShort,
    ),
  ];

  setUp(
    () async {
      ThemeStyle(DefaultTheme());
      MicroApp.instanceManager = InstanceManagerMock();
      createAliasUseCase = MockCreateAliasUseCase();

      homeController = HomeController(
        getShowsUseCase: createAliasUseCase,
      );
      MicroApp.instanceManager.registerLazySingleton<HomeController>(
        () => homeController,
      );
    },
  );

  testGoldens(
    'Home Page Golden Test',
    (tester) async {
      await loadAppFonts();
      homeController.aliases.value = aliases;
      final builder = DeviceBuilder()
        ..addScenario(
          name: 'Should show home page with all widgets',
          widget: const HomePage(),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'HomePage');
    },
  );
}
