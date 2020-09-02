import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_provider_example_for_blog/core/network/network_info.dart';
import 'package:flutter_provider_example_for_blog/core/services/api.dart';
import 'package:flutter_provider_example_for_blog/core/services/number_trivia_service.dart';
import 'package:flutter_provider_example_for_blog/core/viewmodels/number_trivia_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  // !ViewModel
  locator
      .registerFactory(() => NumberTriviaModel(numberTriviaService: locator()));

  // !Services
  locator
      .registerLazySingleton<NumberTriviaService>(() => NumberTriviaServiceImpl(
            api: locator(),
            networkInfo: locator(),
          ));
  locator.registerLazySingleton<Api>(() => ApiImpl(httpClient: locator()));

  // !Core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        dataConnectionChecker: locator(),
      ));

  // !other
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
