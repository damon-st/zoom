import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/resources/jitsi_meet_methods.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/widgets/meeting_option.dart';

class VideCallScreen extends StatefulWidget {
  const VideCallScreen({Key? key}) : super(key: key);

  @override
  State<VideCallScreen> createState() => _VideCallScreenState();
}

class _VideCallScreenState extends State<VideCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    meetingIdController.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  void _joinMeeting() async {
    _jitsiMeetMethods.createdMetting(
        userName: nameController.text,
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          "Join a Meeting",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Room ID",
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: TextField(
                controller: nameController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Name",
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: _joinMeeting,
              child: const Padding(
                padding: EdgeInsets.all(
                  8,
                ),
                child: Text(
                  "Join",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MeeetinOption(
              text: "Muted Audio",
              isMute: isAudioMuted,
              onChange: (value) {
                setState(() {
                  isAudioMuted = !isAudioMuted;
                });
              },
            ),
            MeeetinOption(
              text: "Turn off my video",
              isMute: isVideoMuted,
              onChange: (value) {
                setState(() {
                  isVideoMuted = !isVideoMuted;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
