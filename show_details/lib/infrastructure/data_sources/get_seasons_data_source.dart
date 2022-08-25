import 'package:entities/shows/entities/season.dart';

abstract class GetSeasonsDataSource {
  Future<List<Season>> getSeasons({
    required int id,
  });
}
