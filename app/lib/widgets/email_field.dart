import 'dart:convert';

import 'package:app/screens/notice_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> postData(controller) async {
  final String apiUrl = 'http://192.168.107.18:3000/api/auth/loginemail';
  final Map<String, dynamic> data = {"email": controller};

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type':
          'application/json', // Adjust the content type based on your API requirements
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    // Handle successful response here
    print('API response: ${response.body}');
  } else {
    // Handle errors here
    print('Failed to post data. Status code: ${response.statusCode}');
  }
}

class CustomTextField extends StatelessWidget {
  // final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    // required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    var controller = TextEditingController();

    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.white,
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          fillColor: Colors.white,
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: () {
              postData(controller.text);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NoticePage()),
              );
            },
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 12.0, left: 20),
        ),
      ),
    );
  }
}
