import 'package:micro_app/micro_app.dart';
import 'package:packages/exports.dart';

class HomeDependencies extends MicroAppDependencies {
  final Dio client;
  final String baseUrl;

  HomeDependencies({
    required this.client,
    required this.baseUrl,
  });
}
