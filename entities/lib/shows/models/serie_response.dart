import 'package:entities/shows/models/image.dart';
import 'package:packages/exports.dart';

part 'serie_response.g.dart';

@JsonSerializable()
class SerieResponse extends Equatable {
  final int id;
  final String? url;
  final String? name;
  final ImageResponse? image;
  final String? summary;

  const SerieResponse({
    required this.id,
    this.url,
    this.name,
    this.image,
    this.summary,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        name,
        image,
        summary,
      ];

  factory SerieResponse.fromJson(Map<String, dynamic> json) =>
      _$SerieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SerieResponseToJson(this);

  String loadImage() {
    if (image != null && image!.medium != null) {
      return image!.medium!;
    }
    if (image != null && image!.original != null) {
      return image!.original!;
    }
    return '';
  }
}
