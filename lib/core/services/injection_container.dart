import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl
  //   // App Logic
  //   ..registerFactory(() => PhotosBloc(
  //         getPhotos: sl(),
  //       ))

  //   // Use cases
  //   ..registerLazySingleton(() => GetPhotos(sl()))

  //   // Repositories
  //   ..registerLazySingleton<PhotosRepository>(
  //       () => PhotosRepositoryImplementation(sl()))

  //   // Data Sources
  //   ..registerLazySingleton<PhotosRemoteDataSource>(
  //       () => PhotosRemoteDataSrcImpl(sl()))

  //   // External Dependencies
  //   ..registerLazySingleton(http.Client.new);
}