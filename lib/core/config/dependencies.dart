part of 'config.dart';

final sl = GetIt.instance;

Future<void> _setupDependencies() async {
  await _core;

  await Future.wait([
    _fixtures,
    _prediction,
    _commentary,
    _team,
    _analysis,
  ]);
}

Future<void> get _core async {
  sl.registerFactory(
    () => ThemeBloc(),
  );

  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton<AgoraManager>(() => AgoraManager.instance);
  sl.registerLazySingleton<NotificationManager>(() => NotificationManager.instance);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(
    () => List<AddressCheckOptions>.unmodifiable(
      <AddressCheckOptions>[
        AddressCheckOptions(
          address: InternetAddress(
            '1.1.1.1', // CloudFlare
            type: InternetAddressType.IPv4,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '2606:4700:4700::1111', // CloudFlare
            type: InternetAddressType.IPv6,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '8.8.4.4', // Google
            type: InternetAddressType.IPv4,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '2001:4860:4860::8888', // Google
            type: InternetAddressType.IPv6,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '208.67.222.222', // OpenDNS
            type: InternetAddressType.IPv4,
          ), // OpenDNS
        ),
      ],
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: sl(),
      addresses: sl(),
    ),
  );
}

Future<void> get _fixtures async {
  sl.registerFactory(
    () => FixturesBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FindFixtureByIdBloc(
      useCase: sl(),
    ),
  );

  sl.registerFactory(
    () => FixturesUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory(
    () => FindFixtureByIdUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<FixtureRepository>(
    () => FixtureRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  sl.registerLazySingleton<FixtureRemoteDataSource>(
    () => FixtureRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<FixtureLocalDataSource>(
    () => FixtureLocalDataSourceImpl(),
  );
}

Future<void> get _commentary async {
  sl.registerFactory(
    () => CommentaryBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => LiveCommentaryStatusBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => CurrentlyPlayingCommentaryBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => PlayCommentaryBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => StopCommentaryBloc(
      useCase: sl(),
    ),
  );

  sl.registerFactory(
    () => FetchCommentaryUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory(
    () => FindCommentaryByIdUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory(
    () => LiveCommentaryStatusUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory(
    () => CurrentlyPlayingCommentaryChannelUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory(
    () => PlayCommentaryUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory(
    () => StopCommentaryUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<CommentaryRepository>(
    () => CommentaryRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
      agora: sl(),
    ),
  );

  sl.registerLazySingleton<CommentaryRemoteDataSource>(
    () => CommentaryRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<CommentaryLocalDataSource>(
    () => CommentaryLocalDataSourceImpl(),
  );
}

Future<void> get _prediction async {
  sl.registerFactory(
    () => PredictionBloc(
      useCase: sl(),
    ),
  );

  sl.registerFactory<PredictionUseCase>(
    () => PredictionUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<PredictionRepository>(
    () => PredictionRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  sl.registerLazySingleton<PredictionRemoteDataSource>(
    () => PredictionDataSourceImpl(
      client: sl(),
    ),
  );
}

Future<void> get _team async {
  sl.registerFactory(
    () => TeamBloc(
      useCase: sl(),
    ),
  );

  sl.registerLazySingleton<TeamRepository>(
    () => TeamRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  sl.registerLazySingleton<TeamRemoteDataSource>(
    () => TeamRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<TeamLocalDataSource>(
    () => TeamLocalDataSourceImpl(),
  );

  sl.registerFactory<TeamUsecase>(
    () => TeamUsecase(
      repository: sl(),
    ),
  );
}

Future<void> get _analysis async {
  sl.registerFactory(
    () => AnalysisBloc(
      useCase: sl(),
    ),
  );

  sl.registerFactory(
    () => FetchAnalysisUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory(
    () => FindAnalysisByIdUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<AnalysisRepository>(
    () => AnalysisRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  sl.registerLazySingleton<AnalysisRemoteDataSource>(
    () => AnalysisRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<AnalysisLocalDataSource>(
    () => AnalysisLocalDataSourceImpl(),
  );
}
