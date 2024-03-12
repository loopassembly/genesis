import 'dart:convert';
import 'package:app/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_socket_channel/io.dart';
import 'package:app/screens/forms_screen.dart';

const wsUrl = 'ws://2e5f-103-4-222-252.ngrok-free.app/api/auth/ws/';

class NoticePage extends StatefulWidget {
  final String email;
  const NoticePage({Key? key, required this.email}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  late IOWebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect(wsUrl + widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(55.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              const FittedBox(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Text(
                    'proto.app',
                    style: TextStyle(color: Colors.white, fontSize: 70),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  'check your mail',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  'please check your email inbox for a magic link or code. Click the link or enter the code provided in the email to verify your identity.',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white), // Set color to white
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  // Check if the snapshot data is a String
                  if (snapshot.data is String) {
                    // Parse the message as JSON
                    final message = jsonDecode(snapshot.data);

                    print("Message received: ${message["message"]}");

                    if (message["message"] == "dashboard") {
                      print("Go to dashboard");

                      final token = message["token"];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    token: token,
                                  )));
                      return const Center(
                          child: Text("Go to dashboard",
                              style: TextStyle(color: Colors.white)));
                    } else if (message["message"] == "Signup") {
                      print("Go to the signup page");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormsScreen(
                                    email: widget.email,
                                  )));
                      return const Center(
                          child: Text("Go to the signup page",
                              style: TextStyle(color: Colors.white)));
                    } else {
                      return Center(
                          child: Text("Unknown message received: $message",
                              style: const TextStyle(color: Colors.white)));
                    }
                  } else {
                    return Center(
                      child: Text("Unexpected data type received",
                          style: const TextStyle(color: Colors.white)),
                    );
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
                      // Handle button press
                    },
                    child: const Text(
                      'open inbox',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigate to the dashboard
      //     GoRouter.of(context).go('/dashboard');
      //   },
      //   child: Icon(Icons.dashboard),
      // ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
