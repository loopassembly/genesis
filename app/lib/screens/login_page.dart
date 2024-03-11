import 'package:app/widgets/email_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('login', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Text('email', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 30),
              const CustomTextField()
            ],
          ),
        ),
      ),
    );
  }
}
