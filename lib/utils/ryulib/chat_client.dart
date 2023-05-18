import 'dart:convert';
import 'package:agora_rtm/agora_rtm.dart';

typedef EventNotify = void Function();
typedef EventUserInOut = void Function(String userId);
typedef EventMessage = void Function(String userId, String msg);

class ChatClient {
  static const String agoraAppId = "3558ca41989346a5abc41a73d493cf9c";

  ChatClient._internal();
  static final ChatClient _instance = ChatClient._internal();

  factory ChatClient() {
    return _instance;
  }

  Future joinChannel(String channelId, String userId) async {
    await _createClient();
    await _createChannel(channelId);
    await _client?.login(null, base64.encode(utf8.encode(userId)));
    await _channel?.join();
  }

  Future logout() async {
    await _channel?.leave();
    await _client?.logout();
  }

  void sendMessage(String msg) {
    _channel?.sendMessage(AgoraRtmMessage.fromText(msg));
  }

  Future<List<AgoraRtmMember>>? getMembers() {
    return _channel?.getMembers();
  }

  Future _createClient() async {
    _client = await AgoraRtmClient.createInstance(agoraAppId);
    if (_client == null) {
      if (_onConnectionRefused != null) _onConnectionRefused!();
      return;
    }

    _client?.onConnectionStateChanged = (int state, int reason) async {
      switch (state) {
        case 1:
          if (_onDisconnected != null) _onDisconnected!();
          break;

        case 2:
        case 4: // 재접속도 접속 중으로 처리
          if (_onConnecting != null) _onConnecting!();
          break;

        case 3:
          if (_onConnected != null) _onConnected!();
          break;

        default:
          {
            _client?.logout();
            if (_onConnectionRefused != null) _onConnectionRefused!();
          }
      }
    };
  }

  Future _createChannel(String channelId) async {
    _channel = await _client?.createChannel(channelId);
    _channel?.onMemberJoined = (AgoraRtmMember member) async {      if (_onUserIn != null)
        _onUserIn!(utf8.decode(base64.decode(member.userId)));
    };
    _channel?.onMemberLeft = (AgoraRtmMember member) {
      if (_onUserOut != null)
        _onUserOut!(utf8.decode(base64.decode(member.userId)));
    };

    _channel?.onMessageReceived =
        (AgoraRtmMessage message, AgoraRtmMember member) {
      if (_onMessage != null)
        _onMessage!(utf8.decode(base64.decode(member.userId)), message.text);
    };
  }

  AgoraRtmClient? _client;
  AgoraRtmChannel? _channel;

  EventNotify? _onConnecting;
  set onConnecting(value) {
    _onConnecting = value;
  }

  EventNotify? _onConnected;
  set onConnected(value) {
    _onConnected = value;
  }

  EventNotify? _onDisconnected;
  set onDisconnected(value) {
    _onDisconnected = value;
  }

  EventNotify? _onConnectionRefused;
  set onConnectionRefused(value) {
    _onConnectionRefused = value;
  }

  EventUserInOut? _onUserIn;
  set onUserIn(EventUserInOut value) {
    _onUserIn = value;
  }

  EventUserInOut? _onUserOut;
  set onUserOut(EventUserInOut value) {
    _onUserOut = value;
  }

  EventMessage? _onMessage;
  set onMessage(EventMessage value) {
    _onMessage = value;
  }
}