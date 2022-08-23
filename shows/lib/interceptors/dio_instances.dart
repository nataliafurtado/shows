import 'package:packages/exports.dart';

class DioInstances {
  static Dio? _dio;

  static Dio dioClient() {
    _dio ??= Dio();
    return _dio!;
  }
}
