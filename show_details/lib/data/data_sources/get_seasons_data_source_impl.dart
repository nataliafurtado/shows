import 'package:entities/shows/entities/season.dart';
import 'package:entities/shows/entities/show.dart';
import 'package:entities/shows/models/episode_response.dart';
import 'package:packages/exports.dart';
import 'package:show_details/domain/exceptions/get_shows_exceptions.dart';
import 'package:show_details/infrastructure/data_sources/get_seasons_data_source.dart';

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
        '$baseUrl/seasons/$id/episodes',
      );
      return response.data
          // TODO erro aqui
          .map<Show>(
            (e) => EpisodeResponse.fromJson(e),
          )
          .toList();
    } on Exception catch (_) {
      throw UnableToGetSeasons();
    }
  }
}
