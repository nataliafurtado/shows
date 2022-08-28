import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/exceptions/get_shows_exceptions.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:micro_app/instance_manager_mock.dart';
import 'package:micro_app/micro_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'constants.dart';
import 'home_controller_test.mocks.dart';

@GenerateMocks([
  GetShowsUseCase,
])
void main() {
  late GetShowsUseCase getShowsUseCase;
  late HomeController homeController;

  setUp(
    () {
      MicroApp.instanceManager = InstanceManagerMock();
      getShowsUseCase = MockGetShowsUseCase();
      homeController = HomeController(
        getShowsUseCase: getShowsUseCase,
      );
    },
  );

  tearDown(
    () async {
      homeController.showsLists.value = [];
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

  test(
    'Should init method load shows list',
    () async {
      await makeWhens();
      await homeController.init();
      expect(
        homeController.showsLists.value,
        [
          showsExpected,
          showsExpected,
          showsExpected,
          showsExpected,
          showsExpected,
          showsExpected,
        ],
      );
      expect(
        homeController.homePageState.value,
        HomePageState.success,
      );
    },
  );

  test(
    'Should homePageState.value be HomePageState.error when getShowsUseCase throws exception',
    () async {
      when(
        getShowsUseCase(
          pageId: 0,
        ),
      ).thenThrow(
        Exception(),
      );
      await homeController.init();
      expect(
        homeController.homePageState.value,
        HomePageState.error,
      );
    },
  );

  test(
    'Should getShowList method load shows list',
    () async {
      homeController.showsLists.value = showsListExpected;
      final list = homeController.getShowList(0, 1);
      expect(
        list,
        [
          show,
          show,
          show,
          show,
          show,
          show,
          show,
          show,
          show,
          show,
        ],
      );
    },
  );

  test(
    'Should loadNextPage load 3 pages when called',
    () async {
      homeController.showsLists.value = [];
      homeController.lastId = 1;

      when(
        getShowsUseCase(
          pageId: 1,
        ),
      ).thenAnswer(
        (_) => Future.value(
          showsExpected,
        ),
      );

      await homeController.loadNextPage();
      expect(
        homeController.showsLists.value,
        [
          showsExpected,
          showsExpected,
          showsExpected,
          showsExpected,
        ],
      );
    },
  );

  test(
    'Should  homeController.listPaginationState.value be ListPaginationState.error when getShowsUseCase throws exception',
    () async {
      homeController.showsLists.value = [];
      homeController.lastId = 1;

      when(
        getShowsUseCase(
          pageId: 1,
        ),
      ).thenThrow(
        Exception(),
      );

      await homeController.loadNextPage();
      expect(
        homeController.listPaginationState.value,
        ListPaginationState.error,
      );
    },
  );

  test(
    'Should  homeController.listPaginationState.value be ListPaginationState.finish when getShowsUseCase throws FinishPaginationOfGetShows',
    () async {
      homeController.showsLists.value = [];
      homeController.lastId = 1;

      when(
        getShowsUseCase(
          pageId: 1,
        ),
      ).thenThrow(
        FinishPaginationOfGetShows(),
      );

      await homeController.loadNextPage();
      expect(
        homeController.listPaginationState.value,
        ListPaginationState.finish,
      );
    },
  );

  test(
    'Should  getNextPage return 1 when lasPageId is 1 ',
    () async {
      homeController.lastId = 1;

      final lasPageId = homeController.getNextPage();
      expect(
        lasPageId,
        1,
      );
    },
  );

  test(
    'Should  getNextPage return 2 when lasPageId is 250 ',
    () async {
      homeController.lastId = 250;

      final lasPageId = homeController.getNextPage();
      expect(
        lasPageId,
        2,
      );
    },
  );
}
