import 'package:injectable/injectable.dart';
import 'package:machine_test/domain/core/utils/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
