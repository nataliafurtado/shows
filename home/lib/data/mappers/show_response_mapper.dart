import 'package:entities/shows/show.dart';
import 'package:home/data/models/show_response.dart';

extension ShowsResponseMapper on ShowResponse {
  Show toShow() {
    return Show(
      name: name ?? '',
      url: url ?? '',
      id: id ?? 0,
    );
  }
}
