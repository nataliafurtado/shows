import 'package:entities/shows/entities/season.dart';
import 'package:entities/shows/entities/episode.dart';
import 'package:entities/shows/models/episode_response.dart';
import 'package:packages/exports.dart';
import 'package:show_details/domain/exceptions/get_shows_exceptions.dart';
import 'package:show_details/data/mappers/show_response_mapper.dart';
import 'package:show_details/infrastructure/data_sources/get_seasons_data_source.dart';
import "package:collection/collection.dart";

class GetSeasonsDataSourceImpl extends GetSeasonsDataSource {
  final Dio client;
  final String baseUrl;

  GetSeasonsDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<Season>> getSeasons({required int id}) async {
    try {
      final response = await client.get(
        '$baseUrl/shows/$id/episodes',
      );
      final episodes = response.data
          .map<Episode>(
            (e) => EpisodeResponse.fromJson(e).toEpisode(),
          )
          .toList();

      return formatToSeasons(episodes);
    } catch (e) {
      throw UnableToGetSeasons();
    }
  }

  List<Season> formatToSeasons(List<Episode> episodes) {
    List<Season> seasons = [];
    groupBy(
      episodes,
      (Episode e) {
        return e.season;
      },
    ).forEach(
      (key, value) => seasons.add(
        Season(seasons: value, seasonId: key),
      ),
    );
    return seasons;
  }
}
