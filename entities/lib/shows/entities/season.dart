import 'package:entities/shows/entities/episode.dart';
import 'package:packages/exports.dart';

class Season extends Equatable {
  final int seasonId;
  final List<Episode> seasons;
  const Season({
    required this.seasonId,
    required this.seasons,
  });

  @override
  List<Object> get props => [
        seasons,
      ];
}
