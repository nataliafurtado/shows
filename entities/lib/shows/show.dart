import 'package:packages/exports.dart';

class Show extends Equatable {
  final String name;
  final String url;
  final int id;

  const Show({
    required this.name,
    required this.url,
    required this.id,
  });

  @override
  List<Object> get props => [
        name,
        url,
      ];
}
