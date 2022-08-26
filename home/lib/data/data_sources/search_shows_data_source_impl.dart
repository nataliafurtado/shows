import 'package:entities/shows/entities/show.dart';
import 'package:entities/shows/models/show_response.dart';
import 'package:home/data/mappers/show_response_mapper.dart';
import 'package:home/domain/exceptions/search_shows_exceptions.dart';
import 'package:home/infrastructure/data_sources/search_shows_data_source.dart';
import 'package:packages/exports.dart';

class SearchShowsDataSourceImpl extends SearchShowsDataSource {
  final Dio client;
  final String baseUrl;

  SearchShowsDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<Show>> searchShows({required String query}) async {
    try {
      final response = await client.get(
        '$baseUrl/search/shows',
        queryParameters: {'q': query},
      );
      return response.data
          .map<Show>(
            (e) => ShowResponse.fromJson(e).toShow(),
          )
          .toList();
    } catch (_) {
      throw UnableToSearchShows();
    }
  }
}
