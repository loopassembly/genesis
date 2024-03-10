import 'dart:async';
import 'dart:convert';

import 'package:app/screens/forms_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const redundant_url =
    'http://192.168.107.18:3000/api/auth/ClickStatus/ashutoshanand2560@gmail.com';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageScreenState createState() => _NoticePageScreenState();
}

class _NoticePageScreenState extends State<NoticePage> {
  late StreamController<Map<String, dynamic>> _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<Map<String, dynamic>>.broadcast();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      makeRequest();
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  Future<void> makeRequest() async {
    final apiUrl = redundant_url;

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        _controller
            .add(decodedResponse); // Add the decoded response to the stream

        if (decodedResponse['status'] == 'success') {
          if (decodedResponse['message'] == 'User signup clicked') {
            print('Done');
            stopTimer();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FormsScreen(),
            ));
          } else if (decodedResponse['message'] == 'User not clicked') {
            // Continue making requests
            print('Continue making requests');
          }
        }
      } else {
        print('Failed to make request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void dispose() {
    _controller.close();
    stopTimer(); // Ensure to stop the timer when the widget is disposed
    super.dispose();
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
            StreamBuilder<Map<String, dynamic>>(
              stream: _controller.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Loading indicator while waiting for the API response
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle error
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Check the message in the API response
                  String message = snapshot.data?["message"] ?? "";

                  // If the message indicates that the login is done, navigate to the next page
                  if (message == "User clicked") {
                    // Replace this with your navigation logic
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const DetailsPage()),
                    // );

                    // For demonstration purposes, just print a message
                    print("User is logged in. Navigate to the next page.");
                  }

                  // Display the current message
                  return Text('Message: $message');
                }
              },
            ),
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
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const DetailsPage(),
                    // ));
                  },
                  child: Text(
                    'open inbox',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.black,
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
