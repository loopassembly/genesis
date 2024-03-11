import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

const wsUrl =
    'ws://f506-14-139-187-71.ngrok-free.app/api/auth/ws/btech15106.22@bitmesra.ac.in';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageScreenState createState() => _NoticePageScreenState();
}

class _NoticePageScreenState extends State<NoticePage> {
  late IOWebSocketChannel channel;
  bool _isLoading = true;
  String _message = '';

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect(wsUrl);
    channel.stream.listen(_handleMessage);
  }

  void _handleMessage(dynamic message) {
    setState(() {
      if (message == "User clicked") {
        _message = "Go to dashboard";
        // Navigate to dashboard
      } else if (message == "User details incomplete") {
        _message = "Go to the signup page";
        // Navigate to signup page
      } else {
        _message = "Unknown message received: $message";
      }
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Text(
                  'proto.app',
                  style: TextStyle(color: Colors.white, fontSize: 70),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Text(
                'check your mail',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Text(
                'please check your email inbox for a magic link or code. Click the link or enter the code provided in the email to verify your identity.',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            _isLoading
                ? CircularProgressIndicator()
                : Text('Message: $_message'),
            FittedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text(
                    'open inbox',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
