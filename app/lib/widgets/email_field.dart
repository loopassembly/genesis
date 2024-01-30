import 'package:app/screens/forms_screen.dart';
import 'package:flutter/material.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormsScreen()),
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
          contentPadding: const EdgeInsets.only(top: 12.0),
        ),
      ),
    );
  }
}
