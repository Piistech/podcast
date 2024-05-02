import 'package:equatable/equatable.dart';

class CommentaryEntity extends Equatable {
  final String appId;
  final String token;
  final String channelId;

  const CommentaryEntity({
    required this.appId,
    required this.token,
    required this.channelId,
  });

  @override
  List<Object?> get props => [
        appId,
        token,
        channelId,
      ];
}
