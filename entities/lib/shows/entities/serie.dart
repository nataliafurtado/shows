import 'package:packages/exports.dart';

abstract class Serie extends Equatable {
  final String name;
  final String url;
  final int id;
  final String imageUrl;
  final String summary;

  const Serie({
    required this.name,
    required this.url,
    required this.id,
    required this.imageUrl,
    required this.summary,
  });
}
