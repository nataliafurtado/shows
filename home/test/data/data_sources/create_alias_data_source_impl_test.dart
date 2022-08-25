import 'dart:io';

import 'package:entities/shows/alias.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/data/data_sources/create_alias_data_source_impl.dart';
import 'package:home/domain/exceptions/get_shows_exceptions.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:packages/exports.dart';

void main() {
  final client = Dio();
  final mockWebServer = MockWebServer();
  late CreateAliasDataSourceImpl createAliasDataSourceImpl;

  Future<String> read(String file) async {
    final filePath = 'test/mocks/$file';
    String text;
    try {
      text = await File(filePath).readAsString();
    } catch (e) {
      text = await File('../' + filePath).readAsString();
    }
    return text;
  }

  const aliasExpected = Alias(
    originalURL: 'https://g1.globo.com/',
    shortURL: 'https://url-shortener-nu.herokuapp.com/short/85719',
  );

  group(
    'CreateAliasDataSourceImplTest',
    () {
      setUp(
        () async {
          await mockWebServer.start();
          createAliasDataSourceImpl = CreateAliasDataSourceImpl(
            client: client,
            baseUrl: mockWebServer.url,
          );
        },
      );

      tearDown(
        () async {
          await mockWebServer.shutdown();
        },
      );

      test(
        'should return a filled Alias object with mock values',
        () async {
          final mockResponse = MockResponse()
            ..httpCode = 200
            ..body = await read('create_alias_success.json')
            ..headers = {'content-type': 'application/json; charset=utf-8'};

          mockWebServer.enqueueResponse(mockResponse);

          final alias = await createAliasDataSourceImpl.getShows(
            url: '',
          );
          final request = mockWebServer.takeRequest();

          expect(alias, aliasExpected);
          expect(request.uri.path, '/api/alias');
          expect(request.method, 'POST');
        },
      );

      test(
        'should return UnableToCreateAlias if http throws exception',
        () async {
          final mockResponse = MockResponse()
            ..httpCode = 404
            ..body = await read('create_alias_success.json')
            ..headers = {'content-type': 'application/json; charset=utf-8'};

          mockWebServer.enqueueResponse(mockResponse);

          try {
            await createAliasDataSourceImpl.getShows(
              url: '',
            );
          } catch (ex) {
            expect(ex, isInstanceOf<UnableToGetShows>());
          }
        },
      );
    },
  );
}
