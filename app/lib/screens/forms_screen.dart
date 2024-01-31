import 'package:app/screens/details_page.dart';
import 'package:app/screens/notice_page.dart';
import 'package:flutter/material.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController dobController = TextEditingController();

    void submitForm() {
      String name = nameController.text;
      String dob = dobController.text;

      // Pass data to the next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(name: name, email: dob),
        ),
      );
    }

    return Scaffold(
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
                          submitForm();
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
