import 'package:entities/shows/entities/schedule.dart';
import 'package:entities/shows/entities/show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/use_cases/search_shows_use_case.dart';
import 'package:home/presentation/search/controller/search_controller.dart';
import 'package:micro_app/instance_manager_mock.dart';
import 'package:micro_app/micro_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_controller_test.mocks.dart';

@GenerateMocks([
  SearchShowsUseCase,
])
void main() {
  late SearchShowsUseCase searchShowsUseCase;
  late SearchController searchController;

  setUp(
    () {
      MicroApp.instanceManager = InstanceManagerMock();
      searchShowsUseCase = MockSearchShowsUseCase();
      searchController = SearchController(
        searchShowsUseCase: searchShowsUseCase,
      );
    },
  );

  tearDown(
    () async {
      // searchController.aliases.value = [];
    },
  );

  const showsExpected = [
    Show(
      id: 1,
      url: 'https://www.tvmaze.com/shows/1/under-the-dome',
      name: 'Under the Dome',
      imageUrl:
          'https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg',
      summary:
          '<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The towns inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>',
      schedule: Schedule(
        time: '22:00',
        days: [
          'Thursday',
        ],
      ),
      genres: [
        'Drama',
        'Science-Fiction',
        'Thriller',
      ],
    ),
  ];

  test(
    'Should searchShow method load shows list',
    () async {
      when(
        searchShowsUseCase(
          query: '',
        ),
      ).thenAnswer(
        (_) => Future.value(
          showsExpected,
        ),
      );
      await searchController.searchShow('');
      expect(
        searchController.shows.value,
        showsExpected,
      );
      expect(
        searchController.searchPageState.value,
        SearchPageState.success,
      );
    },
  );

  test(
    'Should searchPageState.value be SearchPageState.error when SearchShowsUseCase throws exception',
    () async {
      when(
        searchShowsUseCase(
          query: '',
        ),
      ).thenThrow(
        Exception(),
      );
      await searchController.searchShow('');
      expect(
        searchController.searchPageState.value,
        SearchPageState.error,
      );
    },
  );
}
