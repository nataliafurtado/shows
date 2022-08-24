import 'package:entities/shows/show.dart';
import 'package:home/data/models/show_response.dart';

extension ShowsResponseMapper on ShowResponse {
  Show toShow() {
    return Show(
      name: name ?? '',
      url: url ?? '',
      id: id ?? 0,
      imageUrl: loadImage(),
    );
  }

  String loadImage() {
    if (image != null && image!.medium != null) {
      return image!.medium!;
    }
    if (image != null && image!.original != null) {
      return image!.original!;
    }
    return '';
  }
}
