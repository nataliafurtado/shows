import 'package:entities/shows/entities/season.dart';
import 'package:show_details/domain/exceptions/get_shows_exceptions.dart';
import 'package:show_details/infrastructure/data_sources/get_seasons_data_source.dart';

class GetSeasonsUseCase {
  final GetSeasonsDataSource getShowsDataSource;
  GetSeasonsUseCase({
    required this.getShowsDataSource,
  });

  Future<List<Season>> call({
    required int id,
  }) async {
    try {
      return await getShowsDataSource.getSeasons(
        id: id,
      );
    } catch (_) {
      throw UnableToGetSeasons();
    }
  }
}
