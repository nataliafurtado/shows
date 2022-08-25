import 'package:entities/shows/entities/show.dart';

abstract class GetShowsDataSource {
  Future<List<Show>> getShows({
    required int pageId,
  });
}
