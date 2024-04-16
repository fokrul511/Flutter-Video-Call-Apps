import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;

final String userId = math.Random().nextInt(10000).toString();
class CallPage extends StatelessWidget {
  final String userName;
  final String callID;

  const CallPage({
    super.key,
    required this.callID,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1345381693,
      appSign:
          "f140196c38b27a339d9b334cce390678adc1cf72a9347664919e31573dffd595",
      userID: userId,
      userName: userName,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
