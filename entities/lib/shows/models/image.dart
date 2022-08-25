import 'package:packages/exports.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageResponse extends Equatable {
  final String? medium;
  final String? original;

  const ImageResponse({
    required this.medium,
    required this.original,
  });

  @override
  List<Object?> get props => [
        medium,
        original,
      ];

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}
