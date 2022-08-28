import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/exceptions/get_shows_exceptions.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/infrastructure/data_sources/get_shows_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_shows_use_case_test.mocks.dart';

@GenerateMocks([
  GetShowsDataSource,
])
void main() {
  late GetShowsDataSource getShowsDataSource;
  late GetShowsUseCase useCase;

  setUp(
    () {
      getShowsDataSource = MockGetShowsDataSource();
      useCase = GetShowsUseCase(
        getShowsDataSource: getShowsDataSource,
      );
    },
  );

  group(
    'On Error',
    () {
      test(
        'Should throw UnableToGetShows when GetShowsDataSource.GetShows throws UnableToGetShows',
        () async {
          when(
            getShowsDataSource.getShows(
              pageId: 1,
            ),
          ).thenThrow(
            UnableToGetShows(),
          );

          try {
            await useCase(
              pageId: 1,
            );
          } catch (e) {
            expect(e, isA<UnableToGetShows>());
          }
        },
      );

      test(
        'Should throw UnableToGetShows when GetShowsDataSource.GetShows throws Exception',
        () async {
          when(
            getShowsDataSource.getShows(
              pageId: 1,
            ),
          ).thenThrow(
            FinishPaginationOfGetShows(),
          );

          try {
            await useCase(
              pageId: 1,
            );
          } catch (e) {
            expect(e, isA<FinishPaginationOfGetShows>());
          }
        },
      );
    },
  );
}
