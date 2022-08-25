import 'package:packages/exports.dart';

part 'schedule.g.dart';

@JsonSerializable()
class ScheduleResponse extends Equatable {
  final String time;
  final List<String> days;

  const ScheduleResponse({
    required this.time,
    required this.days,
  });

  @override
  List<Object?> get props => [
        time,
        days,
      ];

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}
