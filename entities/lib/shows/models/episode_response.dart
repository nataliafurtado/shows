import 'package:entities/shows/models/image.dart';
import 'package:entities/shows/models/serie_response.dart';
import 'package:packages/exports.dart';

part 'episode_response.g.dart';

@JsonSerializable()
class EpisodeResponse extends SerieResponse {
  final int season;
  final int number;

  const EpisodeResponse({
    required int id,
    String? url,
    String? name,
    ImageResponse? image,
    String? summary,
    required this.season,
    required this.number,
  }) : super(
          id: id,
          name: name,
          image: image,
          url: url,
          summary: summary,
        );

  @override
  List<Object?> get props => [
        id,
        url,
        name,
        image,
        season,
        number,
        summary,
      ];

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EpisodeResponseToJson(this);
}
