import 'package:entities/shows/entities/show.dart';
import 'package:home/domain/exceptions/search_shows_exceptions.dart';
import 'package:home/infrastructure/data_sources/search_shows_data_source.dart';

class SearchShowsUseCase {
  final SearchShowsDataSource searchShowsDataSource;
  SearchShowsUseCase({
    required this.searchShowsDataSource,
  });

  Future<List<Show>> call({
    required String query,
  }) async {
    try {
      return await searchShowsDataSource.searchShows(
        query: query,
      );
    } catch (_) {
      throw UnableToSearchShows();
    }
  }
}
