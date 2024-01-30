import 'package:flutter/material.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    
                    decoration: InputDecoration(
                      label: Text("Name",
                          style: Theme.of(context).textTheme.bodySmall),
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
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Date Of Birth",
                          style: Theme.of(context).textTheme.bodySmall),
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
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Name",
                          style: Theme.of(context).textTheme.bodySmall),
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
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
