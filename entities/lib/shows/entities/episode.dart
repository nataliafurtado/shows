import 'package:entities/shows/entities/serie.dart';

class Episode extends Serie {
  final int season;
  final int number;

  const Episode({
    required int id,
    required String url,
    required String name,
    required String imageUrl,
    required String summary,
    required this.season,
    required this.number,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          url: url,
          summary: summary,
        );

  @override
  List<Object> get props => [
        id,
        name,
        url,
        imageUrl,
        season,
        number,
        summary,
      ];
}
