import '../shared.dart';

class AgoraManager {
  static final AgoraManager _instance = AgoraManager._internal();

  AgoraManager._internal();

  static AgoraManager get instance => _instance;

//! ------------------------------------ Agora SDK ------------------------------------

  bool _initialized = false;
  final RtcEngine engine = createAgoraRtcEngine();
  final NotificationManager notificationManager = NotificationManager.instance;

  final StreamController<String?> channelController = StreamController<String?>.broadcast();

  String matchName = '';
  String fixtureGuid = '';
  String fixtureIcon = '';

  Future<void> initialize({
    required String appId,
  }) async {
    if (_initialized) {
      return;
    }
    await engine.initialize(
      RtcEngineContext(
        appId: appId,
        areaCode: AreaCode.areaCodeIn.index,
        audioScenario: AudioScenarioType.audioScenarioMeeting,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );

    _initialized = true;

    await engine.setClientRole(role: ClientRoleType.clientRoleAudience);

    engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) {
          channelController.add(connection.channelId);
          notificationManager.dismissActiveNotification();
          notificationManager.onCommentaryStarted(
            matchName: matchName,
            channelId: connection.channelId!,
            fixtureGuid: fixtureGuid,
            icon: fixtureIcon,
          );
        },
        onLeaveChannel: (connection, stats) {
          channelController.add(null);
          notificationManager.dismissActiveNotification();
        },
        onConnectionStateChanged: (connection, state, reason) {
          if (state == ConnectionStateType.connectionStateConnected) {
            channelController.add(connection.channelId);
          } else {
            channelController.add(null);
          }
        },
        onError: (err, msg) {
          debugPrint('Agora Error: $err, $msg');
        },
      ),
    );
  }

  Future<void> joinChannel({
    required String token,
    required String channelId,
    required String matchName,
    required String fixtureGuid,
    required String fixtureIcon,
  }) async {
    // if ((await channelController.stream.first) != null) {
    //   await leaveChannel();
    // }
    try {
      this.matchName = matchName;
      this.fixtureGuid = fixtureGuid;
      this.fixtureIcon = fixtureIcon;

      await engine.joinChannel(
        token: token,
        channelId: channelId,
        uid: DateTime.now().microsecondsSinceEpoch,
        options: const ChannelMediaOptions(
          audienceLatencyLevel: AudienceLatencyLevelType.audienceLatencyLevelUltraLowLatency,
          autoSubscribeAudio: true,
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
          isInteractiveAudience: false,
          publishMediaPlayerAudioTrack: true,
        ),
      );
    } on AgoraRtcException catch (err) {
      if (err.code.abs() == ErrorCodeType.errJoinChannelRejected.value()) {
        await leaveChannel();
        joinChannel(
          token: token,
          channelId: channelId,
          matchName: matchName,
          fixtureGuid: fixtureGuid,
          fixtureIcon: fixtureIcon,
        );
      }
    }
  }

  Future<void> leaveChannel() async {
    try {
      await engine.leaveChannel();
    } on AgoraRtcException catch (e) {
      debugPrint('Agora Error: $e');
    }
  }
}
