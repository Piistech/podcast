import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  late Map<String, dynamic> config; // Configuration parameters
  String appId = "5e28584de45545a09bdda7983a85cff6";
  static const String channelName = 'ban-vs-ind-match-1-t20wc2024';
  static const String channelToken =
      '007eJxTYPjDk1N11Pz9qsfsM5mj50bmeD292rVof4Fe3sdGB4lnLxwVGExTjSxMLUxSUk1MTU1MEw0sk1JSEs0tLYwTLUyT09LMsuss0hoCGRl8JMOZGRkYGViAGMRnApPMYJIFTMowJCXm6ZYV62bmpejmJpYkZ+ga6pYYGZQnGxkYmTAwAABcYykr';
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
                        Icons.campaign_rounded,
                        size: 72,
                      ),
                    ),
                  ),
                ),
    );
  }

  Future<void> setupAgoraEngine() async {
    // Retrieve or request camera and microphone permissions
    await [Permission.microphone].request();

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
      onAudioPublishStateChanged: (channel, oldState, newState, elapseSinceLastState) {
        debugPrint("Audio Publish State Changed: $newState");
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
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
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
