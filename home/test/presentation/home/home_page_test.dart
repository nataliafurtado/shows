import 'package:design_system/atom/card/show_card.dart';
import 'package:design_system/organism/pages/error_page.dart';
import 'package:design_system/theme_style.dart';
import 'package:design_system/utils/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:home/presentation/home/home_page.dart';
import 'package:micro_app/micro_app.dart';
import 'package:micro_app/instance_manager_mock.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../controller/constants.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks(
  [
    GetShowsUseCase,
  ],
)
void main() {
  late GetShowsUseCase getShowsUseCase;
  late HomeController homeController;

  setUp(
    () async {
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

  testWidgets(
    'should correctly render a HomePage',
    (tester) async {
      await makeWhens();
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      await tester.pump();
      final cardFinder = find.byType(ShowCard);
      final iconFinder = find.byIcon(Icons.search);

      expect(cardFinder, findsWidgets);
      expect(iconFinder, findsOneWidget);
    },
  );

  testWidgets(
    'should correctly render a ErrorPage when getShowsUseCase throws Exception',
    (tester) async {
      when(
        getShowsUseCase(
          pageId: 0,
        ),
      ).thenThrow(
        Exception(),
      );
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pump();
      final errorFinder = find.byType(ErrorPage);
      expect(errorFinder, findsWidgets);
    },
  );
}
