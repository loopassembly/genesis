import 'package:app/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddIDPage extends StatelessWidget {
  const AddIDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "proto.id",
            style: TextStyle(fontSize: 32),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.white,
              height: 1,
            ),
          ),
          bottomOpacity: 1,
          elevation: 0,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "register id",
                style: TextStyle(fontSize: 32),
              ),
              const Gap(16),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  // labelText: "unique identifier",
                  hintText: "unique identifier",
                ),
              ),
              const Gap(16),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  // labelText: "unique identifier",
                  hintText: "otp",
                ),
              ),
              const Gap(8),
              const Text(
                "retry in 5s",
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                onTap: null,
                child: Container(
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.cir cular(16),
                    color: Pallete.whiteColor,
                  ),
                  margin: const EdgeInsets.all(16.0),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'submit',
                        style:
                            TextStyle(fontSize: 24, color: Pallete.blackColor),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        )));
  }
}
