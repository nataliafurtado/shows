import 'package:entities/shows/entities/show.dart';
import 'package:entities/shows/models/show_response.dart';
import 'package:home/domain/exceptions/get_shows_exceptions.dart';
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
        queryParameters: {'page': pageId},
      );
      return response.data
          .map<Show>(
            (e) => ShowResponse.fromJson(e).toShow(),
          )
          .toList();
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        throw FinishPaginationOfGetShows();
      }
      throw UnableToGetShows();
    } catch (_) {
      throw UnableToGetShows();
    }
  }
}
