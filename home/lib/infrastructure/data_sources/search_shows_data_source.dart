import 'package:entities/shows/entities/show.dart';

abstract class SearchShowsDataSource {
  Future<List<Show>> searchShows({
    required String query,
  });
}
