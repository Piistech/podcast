import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class CommentaryRepositoryImpl implements CommentaryRepository {
  final NetworkInfo network;
  final AgoraManager agora;
  final CommentaryLocalDataSource local;
  final CommentaryRemoteDataSource remote;

  CommentaryRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
    required this.agora,
  });

  @override
  Future<Either<Failure, CommentaryEntity>> fetch({
    required String fixtureGuid,
  }) async {
    try {
      final CommentaryModel commentary = local.findById(fixtureGuid: fixtureGuid);
      await agora.initialize(appId: commentary.appId);
      return Right(commentary);
    } on CommentaryNotFoundFailure {
      if (await network.online) {
        try {
          final CommentaryModel commentary = await remote.fetch(fixtureGuid: fixtureGuid);

          await agora.initialize(appId: commentary.appId);

          local.cache(
            fixtureGuid: fixtureGuid,
            commentary: commentary,
          );
          return Right(commentary);
        } on Failure catch (e) {
          return Left(e);
        }
      } else {
        return Left(NoInternetFailure());
      }
    }
  }

  @override
  Either<Failure, CommentaryEntity> findById({
    required String fixtureGuid,
  }) {
    try {
      final CommentaryModel commentary = local.findById(fixtureGuid: fixtureGuid);
      return Right(commentary);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Stream<bool> get live async* {
    await for (final String? channelName in agora.channelController.stream) {
      yield channelName != null;
    }
  }

  @override
  Stream<Either<Failure, String?>> get liveChannel {
    return agora.channelController.stream.transform(StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        sink.add(Right(data));
      },
      handleError: (error, stackTrace, sink) {
        sink.add(Left(error as Failure));
      },
    ));
  }

  @override
  Future<Either<Failure, void>> play({
    required String token,
    required String channelId,
    required String fixtureGuid,
    required String fixtureIcon,
    required String matchName,
  }) async {
    try {
      await agora.joinChannel(
        token: token,
        channelId: channelId,
        matchName: matchName,
        fixtureGuid: fixtureGuid,
        fixtureIcon: fixtureIcon,
      );
      return const Right(null);
    } catch (e) {
      return Left(
        LiveCommentaryPlayingFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> stop() async {
    try {
      await agora.leaveChannel();
      return const Right(null);
    } catch (e) {
      return Left(
        LiveCommentaryPlayingFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
