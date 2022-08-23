import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/exceptions/create_alias_exceptions.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:home/infrastructure/data_sources/get_shows_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'create_alias_use_case_test.mocks.dart';

@GenerateMocks([
  GetShowsDataSource,
])
void main() {
  late GetShowsDataSource createAliasDataSource;
  late GetShowsUseCase useCase;

  setUp(
    () {
      createAliasDataSource = MockCreateAliasDataSource();
      useCase = GetShowsUseCase(
        getShowsDataSource: createAliasDataSource,
      );
    },
  );

  group(
    'On Error',
    () {
      test(
        'Should throw UnableToCreateAlias when createAliasDataSource.createAlias throws UnableToCreateAlias',
        () async {
          when(
            createAliasDataSource.getShows(
              url: '',
            ),
          ).thenThrow(
            UnableToGetShows(),
          );

          try {
            await useCase(
              url: '',
            );
          } catch (e) {
            expect(e, isA<UnableToGetShows>());
          }
        },
      );

      test(
        'Should throw UnableToCreateAlias when createAliasDataSource.createAlias throws Exception',
        () async {
          when(
            createAliasDataSource.getShows(
              url: '',
            ),
          ).thenThrow(
            Exception(),
          );

          try {
            await useCase(
              url: '',
            );
          } catch (e) {
            expect(e, isA<UnableToGetShows>());
          }
        },
      );
    },
  );
}
