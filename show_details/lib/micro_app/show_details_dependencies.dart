import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';

class ShowDetailsDependencies extends MicroAppDependencies {
  final Dio client;
  final String baseUrl;

  ShowDetailsDependencies({
    required this.client,
    required this.baseUrl,
  });
}
