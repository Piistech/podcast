import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

class AudiencePage extends StatefulWidget {
  const AudiencePage({super.key});

  @override
  State<AudiencePage> createState() => _AudiencePageState();
}

class _AudiencePageState extends State<AudiencePage> {
  late Map<String, dynamic> config; // Configuration parameters
  String appId = "5e28584de45545a09bdda7983a85cff6";
  static const String channelName = 'ban-vs-ind-match-1-t20wc2024';
  static const String channelToken =
      '007eJxTYDAO7n+3py9ejH2NwQvXczcP8fs/ibFS/F/HuWOW4ae92bkKDKapRhamFiYpqSampiamiQaWSSkpieaWFsaJFqbJaWlmFyYYpDUEMjJs09RhYmRgZGABYhCfCUwyg0kWMCnDkJSYp1tWrJuZl6Kbm1iSnKFrqFtiZFCebGRgZMLAAAAjcCkS';
  bool isJoined = false; // Indicates if the local user has joined the channel
  RtcEngine? agoraEngine; // Agora engine instance

  QualityType quality = QualityType.qualityUnknown;

  bool connecting = false;
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isJoined ? Colors.green : Colors.red,
      body: connected
          ? Center(
              child: IconButton(
                iconSize: 72,
                onPressed: () {
                  leave();
                },
                icon: const CircleAvatar(
                  radius: 72,
                  child: Icon(
                    Icons.logout_rounded,
                    size: 72,
                  ),
                ),
              ),
            )
          : connecting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: IconButton(
                    iconSize: 72,
                    onPressed: () {
                      setupAgoraEngine();
                    },
                    icon: const CircleAvatar(
                      radius: 72,
                      child: Icon(
                        Icons.wifi_tethering_rounded,
                        size: 72,
                      ),
                    ),
                  ),
                ),
    );
  }

  Future<void> setupAgoraEngine() async {
    // Create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine!.initialize(RtcEngineContext(appId: appId));

// Register the event handler
    agoraEngine!.registerEventHandler(getEventHandler());

    await joinChannel();
  }

  RtcEngineEventHandler getEventHandler() {
    return RtcEngineEventHandler(
      onNetworkQuality: (connection, remoteUid, txQuality, rxQuality) {
        setState(() {
          quality = rxQuality;
        });
      },
      onError: (err, msg) {
        debugPrint(msg);
        switch (err) {
          case ErrorCodeType.errConnectionLost:
          case ErrorCodeType.errAborted:
          case ErrorCodeType.errCanceled:
            leave();
          default:
        }
      },
      onConnectionStateChanged: (connection, state, reason) {
        debugPrint("Connection State Changed: $state $reason");
        if (state == ConnectionStateType.connectionStateConnecting) {
          setState(() {
            connecting = true;
            connected = false;
          });
        } else if (state == ConnectionStateType.connectionStateConnected) {
          setState(() {
            connected = true;
            connecting = false;
          });
        } else if (state == ConnectionStateType.connectionStateDisconnected) {
          setState(() {
            connected = false;
            connecting = false;
          });
        }
      },
      // Occurs when a local user joins a channel
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        setState(() {
          isJoined = true;
        });
      },
      onLeaveChannel: (connection, stats) {
        setState(() {
          isJoined = false;
        });
      },
      onUserJoined: (connection, remoteUid, elapsed) {
        debugPrint("User $remoteUid joined");
      },
      onUserStateChanged: (connection, remoteUid, state) {
        debugPrint("User $remoteUid state changed: $state");
      },
      onLocalUserRegistered: (uid, userAccount) {
        debugPrint("Local user $uid registered");
        setState(() {
          isJoined = true;
        });
      },
      onAudioSubscribeStateChanged: (channel, uid, oldState, newState, elapseSinceLastState) {
        debugPrint("Audio Subscribe State Changed: $uid $newState");
      },
      onUserInfoUpdated: (uid, userInfo) {
        debugPrint("User Info Updated: $uid");
      },
    );
  }

  Future<void> joinChannel() async {
    // Join the channel
    try {
      await agoraEngine!.joinChannel(
        token: channelToken,
        channelId: channelName,
        uid: DateTime.now().microsecondsSinceEpoch,
        options: const ChannelMediaOptions(
          autoSubscribeAudio: true,
          clientRoleType: ClientRoleType.clientRoleAudience,
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
          audienceLatencyLevel: AudienceLatencyLevelType.audienceLatencyLevelUltraLowLatency,
        ),
      );
      debugPrint("joinChannel success");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> leave() async {
    // Clear saved remote Uids

    // Leave the channel
    if (agoraEngine != null) {
      await agoraEngine!.leaveChannel();
    }
    isJoined = false;

    // Destroy the Agora engine instance
    destroyAgoraEngine();
  }

  void destroyAgoraEngine() {
    // Release the RtcEngine instance to free up resources
    if (agoraEngine != null) {
      agoraEngine!.release();
      agoraEngine = null;
    }
  }
}
