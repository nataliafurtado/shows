import 'package:entities/shows/models/episode_response.dart';
import 'package:entities/shows/entities/episode.dart';

extension EpisodeResponseMapper on EpisodeResponse {
  Episode toEpisode() {
    return Episode(
      id: id,
      name: name ?? '',
      imageUrl: loadImage(),
      number: number,
      season: season,
      summary: summary ?? '',
      url: url ?? '',
    );
  }
}
