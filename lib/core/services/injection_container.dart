import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_words/data/datasources/cards_remote_data_source.dart';
import 'package:flutter_words/data/datasources/remote_config_service.dart';
import 'package:flutter_words/data/repositories/cards_repository_implementation.dart';
import 'package:flutter_words/domain/repositories/cards_repository.dart';
import 'package:flutter_words/domain/usecases/get_cards.dart';
import 'package:flutter_words/presentation/screens/home_screen/cards_bloc/cards_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // App Logic
    ..registerFactory(() => CardsBloc(
          getCards: sl(),
        ))

    // Use cases
    ..registerLazySingleton(() => GetCards(sl()))

    // Repositories
    ..registerLazySingleton<CardsRepository>(
        () => CardsRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<CardsRemoteDataSource>(
        () => CardsRemoteDataSrcImpl(sl(), sl()))
    ..registerLazySingleton(
        () => RemoteConfigService(remoteConfig: FirebaseRemoteConfig.instance))

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}
