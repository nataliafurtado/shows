import 'package:entities/shows/show.dart';
import 'package:home/data/models/show_response.dart';
import 'package:home/domain/exceptions/create_alias_exceptions.dart';
import 'package:home/data/mappers/show_response_mapper.dart';
import 'package:home/infrastructure/data_sources/get_shows_data_source.dart';
import 'package:packages/exports.dart';

class CreateAliasDataSourceImpl extends GetShowsDataSource {
  final Dio client;
  final String baseUrl;

  CreateAliasDataSourceImpl({
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

      response.data.map((e) => print('ss')).toList();
// [].map((e) => null)
      // print(response.data.toString());
      // final aliasResponse = ShowResponse.fromJson(response.data);
      // return aliasResponse.toShows();
      return [];
    } on Exception catch (_) {
      throw UnableToGetShows();
    }
  }
}
