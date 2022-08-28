import 'package:design_system/theme_style.dart';
import 'package:design_system/utils/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:home/presentation/home/home_page.dart';
import 'package:micro_app/instance_manager_mock.dart';
import 'package:micro_app/micro_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../controller/constants.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([
  GetShowsUseCase,
])
void main() {
  late GetShowsUseCase getShowsUseCase;
  late HomeController homeController;

  setUp(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      ThemeStyle(DefaultTheme());
      MicroApp.instanceManager = InstanceManagerMock();
      getShowsUseCase = MockGetShowsUseCase();

      homeController = HomeController(
        getShowsUseCase: getShowsUseCase,
      );
      MicroApp.instanceManager.registerLazySingleton<HomeController>(
        () => homeController,
      );
    },
  );

  Future makeWhens() async {
    for (var i = 0; i < 6; i++) {
      when(
        getShowsUseCase(
          pageId: i,
        ),
      ).thenAnswer(
        (_) => Future.value(
          showsExpected,
        ),
      );
    }
  }

  testGoldens(
    'Home Page Golden Test',
    (tester) async {
      await loadAppFonts();
      await makeWhens();

      final builder = DeviceBuilder()
        ..addScenario(
          name: 'Should show home page with all widgets',
          widget: const HomePage(),
        );
      await tester.pumpDeviceBuilder(builder);
//TODO: fix here
      // await addDelay(18000);
      // for (int count = 0; count < 10; count += 1) await tester.pump();
      await tester.pump();
      // await tester.pumpAndSettle(const Duration(seconds: 10));
      // TickerFuture.complete();
      // await tester.pump(new Duration(milliseconds: 3000));
      // await Future.delayed(Duration(seconds: 2));
      // for (int i = 0; i < 10; i++) {
      //   await tester.pump(Duration(seconds: 1));
      // }
      //  await expectLater(find.byType(MyApp),
      //                matchesGoldenFile(‘goldens/main.png’));
      await screenMatchesGolden(tester, 'HomePage');
      // await tester.(() async {
      //   await screenMatchesGolden(tester, 'HomePage');
      // });
    },
  );
}
