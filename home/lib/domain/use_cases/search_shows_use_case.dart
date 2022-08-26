import 'package:entities/shows/entities/show.dart';
import 'package:home/domain/exceptions/search_shows_exceptions.dart';
import 'package:home/infrastructure/data_sources/search_shows_data_source.dart';

class SearchShowsUseCase {
  final SearchShowsDataSource getShowsDataSource;
  SearchShowsUseCase({
    required this.getShowsDataSource,
  });

  Future<List<Show>> call({
    required String query,
  }) async {
    try {
      return await getShowsDataSource.searchShows(
        query: query,
      );
    } catch (_) {
      throw UnableToSearchShows();
    }
  }
}
