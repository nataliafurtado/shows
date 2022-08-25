import 'package:entities/shows/entities/episode.dart';
import 'package:packages/exports.dart';

class Season extends Equatable {
  final List<Episode> seasons;
  const Season({required this.seasons});

  @override
  List<Object> get props => [
        seasons,
      ];
}
