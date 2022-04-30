import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';
import 'package:zoom/resources/jitsi_meet_methods.dart';
import 'package:zoom/widgets/home_meeting_button.dart';

class MeetinScreen extends StatelessWidget {
  MeetinScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  void createdNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 1000000).toString();
    _jitsiMeetMethods.createdMetting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  void joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, "/VideCallScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: () {
                createdNewMeeting();
              },
              icon: Icons.videocam,
              text: "New Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {
                joinMeeting(context);
              },
              icon: Icons.add_box_rounded,
              text: "Join Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: "Schedule",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: "Share Screen",
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Create/Join Meetings with just a click!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyBackgroundScreen extends StatelessWidget {
  const MyBackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Text('This is my background screen!')));
  }
}
