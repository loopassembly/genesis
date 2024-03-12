import 'dart:convert';

import 'package:app/screens/details_page.dart';
import 'package:app/screens/login_page.dart';
import 'package:app/screens/notice_page.dart';
import 'package:app/widgets/protoAppBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormsScreen extends StatelessWidget {
  final String email;
  const FormsScreen({Key? key, required this.email}) : super(key: key);

  final String url = "https://2e5f-103-4-222-252.ngrok-free.app/";
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController dobController = TextEditingController();

    Future<void> submitForm(BuildContext context) async {
      String name = nameController.text;
      String dob = dobController.text;

      final url =
          "https://2e5f-103-4-222-252.ngrok-free.app/api/auth/register/vr8449@srmist.edu.in"; //$email";
      final Map<String, String> requestBody = {
        "Name": name,
        "dob": dob,
      };

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Request successful, navigate to the next page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
        // Request failed, handle error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to submit form. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      appBar: protoAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      style: Theme.of(context).textTheme.bodySmall,
                      controller: nameController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Name",
                              style: Theme.of(context).textTheme.bodySmall),
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
                        contentPadding: const EdgeInsets.only(top: 12.0),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodySmall,
                      controller: dobController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Date Of Birth",
                              style: Theme.of(context).textTheme.bodySmall),
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
                        contentPadding: const EdgeInsets.only(top: 12.0),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward, color: Colors.black),
                        onPressed: () {
                          submitForm(context);
                        },
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
