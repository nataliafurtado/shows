import 'package:entities/shows/entities/schedule.dart';
import 'package:entities/shows/entities/serie.dart';

class Show extends Serie {
  final Schedule schedule;
  final List<String> genres;

  const Show({
    required int id,
    required String url,
    required String name,
    required String imageUrl,
    required String summary,
    required this.schedule,
    required this.genres,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          url: url,
          summary: summary,
        );

  @override
  List<Object> get props => [
        name,
        url,
        schedule,
        genres,
        summary,
      ];
}
