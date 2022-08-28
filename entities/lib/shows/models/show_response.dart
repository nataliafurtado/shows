import 'package:entities/shows/models/image.dart';
import 'package:entities/shows/models/schedule.dart';
import 'package:entities/shows/models/serie_response.dart';
import 'package:packages/exports.dart';

part 'show_response.g.dart';

@JsonSerializable()
class ShowResponse extends SerieResponse {
  final ScheduleResponse schedule;
  final List<String> genres;
  final String? type;
  final String? status;

  const ShowResponse({
    required int id,
    String? url,
    String? name,
    ImageResponse? image,
    String? summary,
    required this.schedule,
    required this.genres,
    this.type,
    this.status,
  }) : super(
          id: id,
          name: name,
          image: image,
          url: url,
          summary: summary,
        );

  @override
  List<Object?> get props => [
        id,
        url,
        name,
        image,
        schedule,
        genres,
        summary,
        type,
        status,
      ];

  factory ShowResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ShowResponseToJson(this);
}
