import 'package:design_system/atom/button/icon_button_widget.dart';
import 'package:design_system/atom/text_field.dart/text_field_widget.dart';
import 'package:design_system/theme_style.dart';
import 'package:design_system/utils/default_theme.dart';
import 'package:entities/shows/alias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:home/presentation/home/home_page.dart';
import 'package:home/utils/home_strings.dart';
import 'package:micro_app/micro_app.dart';
import 'package:micro_app/instance_manager_mock.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks(
  [
    GetShowsUseCase,
  ],
)
void main() {
  late GetShowsUseCase createAliasUseCase;
  late HomeController homeController;

  const String testOriginal = 'testOriginal';
  const String testShort = 'testShort';
  const String url = 'www.g1.com.br';

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

  tearDown(
    () async {
      homeController.aliases.value = [];
    },
  );
  testWidgets(
    'should correctly render a HomePage',
    (tester) async {
      homeController.aliases.value = aliases;

      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final urlFinder = find.text(HomeStrings.enterUrl);
      final titleFinder = find.text(HomeStrings.recentlyShortenedUrls);
      final testOriginalFinder = find.text(testOriginal);

      expect(urlFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(testOriginalFinder, findsOneWidget);
      expect(
        find.byType(
          IconButtonWidget,
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Should correctly add a new card in recently shortened urls',
    (tester) async {
      when(
        createAliasUseCase(
          url: url,
        ),
      ).thenAnswer(
        (_) => Future.value(
          const Alias(
            originalURL: testOriginal,
            shortURL: testShort,
          ),
        ),
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final textField = find.widgetWithText(
        TextFieldWidget,
        HomeStrings.enterUrl,
      );

      final button = find.widgetWithIcon(
        TextButton,
        Icons.play_arrow_sharp,
      );

      await tester.enterText(textField, url);
      await tester.tap(button);

      await tester.pumpAndSettle();

      final testOriginalFinder = find.text(testOriginal);
      final testShortFinder = find.text(testShort);
      expect(testOriginalFinder, findsOneWidget);
      expect(testShortFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should  clean TextField when clean icon button is clicked',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      final textField = find.widgetWithText(
        TextFieldWidget,
        HomeStrings.enterUrl,
      );
      await tester.enterText(textField, url);
      await tester.pumpAndSettle();
      final urlFinder = find.text(url);
      expect(urlFinder, findsOneWidget);

      final button = find.byType(
        IconButton,
      );
      await tester.tap(button);
      await tester.pumpAndSettle();

      final enterUrlFinder = find.text(HomeStrings.enterUrl);
      expect(enterUrlFinder, findsOneWidget);
    },
  );
}
