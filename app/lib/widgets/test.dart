import 'dart:async';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late StreamController<Map<String, dynamic>> _controller;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<Map<String, dynamic>>();
    
    // Replace this with your actual API call logic 
    // Simulating API response after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      _controller.add({
        "message": "User not clicked",
        "status": "success",
      });
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, dynamic>>(
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
            //   MaterialPageRoute(builder: (context) => NextPage()),
            // );

            // For demonstration purposes, just print a message
            print("User is logged in. Navigate to the next page.");
          }

          // Display the current message
          return Text('Message: $message');
        }
      },
    );
  }
}
