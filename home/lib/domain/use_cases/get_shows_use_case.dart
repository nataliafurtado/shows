import 'package:entities/shows/show.dart';
import 'package:home/domain/exceptions/get_shows_exceptions.dart';
import 'package:home/infrastructure/data_sources/get_shows_data_source.dart';

class GetShowsUseCase {
  final GetShowsDataSource getShowsDataSource;
  GetShowsUseCase({
    required this.getShowsDataSource,
  });

  Future<List<Show>> call({
    required int pageId,
  }) async {
    try {
      return await getShowsDataSource.getShows(
        pageId: pageId,
      );
    } on FinishPaginationOfGetShows {
      rethrow;
    } catch (_) {
      throw UnableToGetShows();
    }
  }
}
