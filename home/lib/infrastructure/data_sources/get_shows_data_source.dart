import 'package:entities/shows/show.dart';

abstract class GetShowsDataSource {
  Future<List<Show>> getShows({
    required int pageId,
  });
}
