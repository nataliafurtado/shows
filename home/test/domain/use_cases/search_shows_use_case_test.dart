import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/exceptions/search_shows_exceptions.dart';
import 'package:home/domain/use_cases/search_shows_use_case.dart';
import 'package:home/infrastructure/data_sources/search_shows_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_shows_use_case_test.mocks.dart';

@GenerateMocks([
  SearchShowsDataSource,
])
void main() {
  late SearchShowsDataSource searchShowsDataSource;
  late SearchShowsUseCase useCase;

  setUp(
    () {
      searchShowsDataSource = MockSearchShowsDataSource();
      useCase = SearchShowsUseCase(
        searchShowsDataSource: searchShowsDataSource,
      );
    },
  );

  group(
    'On Error',
    () {
      test(
        'Should throw UnableToSearchShows when SearchShowsDataSource.SearchShows throws UnableToSearchShows',
        () async {
          when(
            searchShowsDataSource.searchShows(
              query: '',
            ),
          ).thenThrow(
            UnableToSearchShows(),
          );

          try {
            await useCase(
              query: '',
            );
          } catch (e) {
            expect(e, isA<UnableToSearchShows>());
          }
        },
      );
    },
  );
}
