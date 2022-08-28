import 'package:entities/shows/entities/show.dart';
import 'package:entities/shows/models/show_response.dart';
import 'package:home/data/mappers/schedule_response_mapper.dart';

extension ShowsResponseMapper on ShowResponse {
  Show toShow() {
    return Show(
      id: id,
      name: name ?? '',
      url: url ?? '',
      imageUrl: loadImage(),
      genres: genres,
      schedule: schedule.toSchedule(),
      summary: summary ?? '',
      status: status ?? '',
      type: type ?? '',
    );
  }
}
