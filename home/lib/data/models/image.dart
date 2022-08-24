import 'package:packages/exports.dart';

part 'image.g.dart';

@JsonSerializable()
class Image extends Equatable {
  final String? medium;
  final String? original;

  const Image({
    required this.medium,
    required this.original,
  });

  @override
  List<Object?> get props => [
        medium,
        original,
      ];

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
