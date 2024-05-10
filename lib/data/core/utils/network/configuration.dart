import 'package:injectable/injectable.dart';
import 'package:machine_test/domain/core/utils/network/app_environment.dart';

abstract class Configuration {
  String get getBaseUrl;
}

@LazySingleton(as: Configuration, env: [AppEnvironment.dev])
class DevConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://maps.googleapis.com/maps/api/place/';
}
