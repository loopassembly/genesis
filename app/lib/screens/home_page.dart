import 'package:app/screens/login_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'proto.app',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'manage',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'verify',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'control',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 150
              ,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
                    child: Text(
                      'next',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24.84,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  trailing: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 10),
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
