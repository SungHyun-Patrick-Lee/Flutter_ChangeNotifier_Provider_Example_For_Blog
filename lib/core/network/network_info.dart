import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImpl({
    @required this.dataConnectionChecker,
  });

  @override
  Future<bool> isConnected() async {
    return await dataConnectionChecker.hasConnection;
  }
}
