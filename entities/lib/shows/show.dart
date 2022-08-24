import 'package:packages/exports.dart';

class Show extends Equatable {
  final String name;
  final String url;
  final int id;
  final String imageUrl;

  const Show({
    required this.name,
    required this.url,
    required this.id,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [
        name,
        url,
      ];
}
