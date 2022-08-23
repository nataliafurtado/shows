import 'package:packages/exports.dart';

class Alias extends Equatable {
  final String originalURL;
  final String shortURL;

  const Alias({
    required this.originalURL,
    required this.shortURL,
  });

  @override
  List<Object> get props => [
        originalURL,
        shortURL,
      ];
}
