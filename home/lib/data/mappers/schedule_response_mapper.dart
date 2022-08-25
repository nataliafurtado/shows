import 'package:entities/shows/models/schedule.dart';
import 'package:entities/shows/entities/schedule.dart';

extension ScheduleResponseMapper on ScheduleResponse {
  Schedule toSchedule() {
    return Schedule(
      days: days,
      time: time,
    );
  }
}
