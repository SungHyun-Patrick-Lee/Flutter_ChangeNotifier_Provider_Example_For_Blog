import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_provider_example_for_blog/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

main() {
  NetworkInfoImpl networkInfoImpl;
  MockDataConnectionChecker connectionChecker;

  setUp(() {
    connectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(dataConnectionChecker: connectionChecker);
  });

  group('networkInfo', () {
    test(
      'isConnected() 가 잘 작동하는지 확인',
      () async {
        // arrange
        final testBool = true;
        final testFuture = Future.value(testBool);
        when(connectionChecker.hasConnection)
            .thenAnswer((_) async => testFuture);
        // act
        final result = await networkInfoImpl.isConnected();
        // assert
        verify(connectionChecker.hasConnection);
        expect(result, testBool);
      },
    );
  });
}
