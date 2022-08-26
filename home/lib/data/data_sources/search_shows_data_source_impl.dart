import 'package:entities/shows/entities/show.dart';
import 'package:entities/shows/models/show_response.dart';
import 'package:entities/shows/models/search_response.dart';
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
      final List<SearchResponse> searchs = response.data
          .map<SearchResponse>(
            (e) => SearchResponse.fromJson(e),
          )
          .toList();
      final showList = <Show>[];
      for (var search in searchs) {
        showList.add(search.show.toShow());
      }

      return showList;
    } catch (_) {
      throw UnableToSearchShows();
    }
  }
}
