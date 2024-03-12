import 'package:app/widgets/email_field.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/protoAppBar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: protoAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('login', style: Theme.of(context).textTheme.titleLarge),
              // const SizedBox(height: 20),
              Text('Enter your email',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 30),
              const CustomTextField()
            ],
          ),
        ),
      ),
    );
  }
}
