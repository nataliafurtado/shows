import 'package:entities/shows/entities/schedule.dart';
import 'package:entities/shows/entities/show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/data/data_sources/get_shows_data_source_impl.dart';
import 'package:home/domain/exceptions/get_shows_exceptions.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:packages/exports.dart';

import 'test_functions.dart';

void main() {
  final client = Dio();
  final mockWebServer = MockWebServer();
  late GetShowsDataSourceImpl getShowsDataSourceImpl;

  const showsExpected = [
    Show(
      id: 1,
      url: 'https://www.tvmaze.com/shows/1/under-the-dome',
      name: 'Under the Dome',
      imageUrl:
          'https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg',
      summary:
          '<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The towns inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>',
      schedule: Schedule(
        time: '22:00',
        days: [
          'Thursday',
        ],
      ),
      genres: [
        'Drama',
        'Science-Fiction',
        'Thriller',
      ],
      status: 'Ended',
      type: 'Scripted',
    ),
  ];

  group(
    'GetShowsDataSourceImplTest',
    () {
      setUp(
        () async {
          await mockWebServer.start();
          getShowsDataSourceImpl = GetShowsDataSourceImpl(
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
        'should return a List<Show> object with the mock values',
        () async {
          final mockResponse = MockResponse()
            ..httpCode = 200
            ..body = await read('get_show_success.json')
            ..headers = {'content-type': 'application/json; charset=utf-8'};

          mockWebServer.enqueueResponse(mockResponse);

          final shows = await getShowsDataSourceImpl.getShows(
            pageId: 1,
          );
          final request = mockWebServer.takeRequest();

          expect(shows, showsExpected);
          expect(request.method, 'GET');
        },
      );

      test(
        'should return FinishPaginationOfGetShows if http throws http exception 404',
        () async {
          final mockResponse = MockResponse()
            ..httpCode = 404
            ..body = await read('get_show_success.json')
            ..headers = {'content-type': 'application/json; charset=utf-8'};

          mockWebServer.enqueueResponse(mockResponse);

          try {
            await getShowsDataSourceImpl.getShows(
              pageId: 1,
            );
          } catch (ex) {
            expect(ex, isInstanceOf<FinishPaginationOfGetShows>());
          }
        },
      );

      test(
        'should return UnableToGetShows if http throws http exception 500',
        () async {
          final mockResponse = MockResponse()
            ..httpCode = 500
            ..body = await read('get_show_success.json')
            ..headers = {'content-type': 'application/json; charset=utf-8'};

          mockWebServer.enqueueResponse(mockResponse);

          try {
            await getShowsDataSourceImpl.getShows(
              pageId: 1,
            );
          } catch (ex) {
            expect(ex, isInstanceOf<UnableToGetShows>());
          }
        },
      );
    },
  );
}
