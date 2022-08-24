import 'package:entities/shows/show.dart';
import 'package:home/data/models/show_response.dart';
import 'package:home/domain/exceptions/create_alias_exceptions.dart';
import 'package:home/data/mappers/show_response_mapper.dart';
import 'package:home/infrastructure/data_sources/get_shows_data_source.dart';
import 'package:packages/exports.dart';

class GetShowsDataSourceImpl extends GetShowsDataSource {
  final Dio client;
  final String baseUrl;

  GetShowsDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<Show>> getShows({required int pageId}) async {
    try {
      final response = await client.get(
        '$baseUrl/shows',
        queryParameters: {'page': 1},
      );
      return response.data
          .map<Show>(
            (e) => ShowResponse.fromJson(e).toShow(),
          )
          .toList();
    } on Exception catch (_) {
      throw UnableToGetShows();
    }
  }
}
