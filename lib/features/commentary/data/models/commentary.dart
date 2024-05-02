import '../../../../core/shared/shared.dart';
import '../../commentary.dart';

class CommentaryModel extends CommentaryEntity {
  const CommentaryModel({
    required super.appId,
    required super.token,
    required super.channelId,
  });

  factory CommentaryModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      assert(
        map.containsKey('appId'),
        "CommentaryModel.parse: map doesn't contain key 'appId'",
      );
      assert(
        map['appId'] is String,
        "CommentaryModel.parse: map['appId'] is not a String",
      );

      assert(
        map.containsKey('token'),
        "CommentaryModel.parse: map doesn't contain key 'token'",
      );
      assert(
        map['token'] is String,
        "CommentaryModel.parse: map['token'] is not a String",
      );

      assert(
        map.containsKey('channelId'),
        "CommentaryModel.parse: map doesn't contain key 'channelId'",
      );
      assert(
        map['channelId'] is String,
        "CommentaryModel.parse: map['channelId'] is not a String",
      );

      return CommentaryModel(
        appId: map['appId'],
        token: map['token'],
        channelId: map['channelId'],
      );
    } catch (e, stackTrace) {
      throw CommentaryModelParsingFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
