import 'package:equatable/equatable.dart';

class CommentaryEntity extends Equatable {
  final String appId;
  final String token;
  final String channelId;
  final String summary;

  const CommentaryEntity({
    required this.appId,
    required this.token,
    required this.channelId,
    required this.summary,
  });

  @override
  List<Object?> get props => [
        appId,
        token,
        channelId,
        summary,
      ];
}
