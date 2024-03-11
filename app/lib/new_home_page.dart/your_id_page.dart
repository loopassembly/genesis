import 'package:app/theme/pallete.dart';
import 'package:flutter/material.dart';

class YourIdPage extends StatelessWidget {
  const YourIdPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "your ids",
              style: TextStyle(fontSize: 32),
            ),
            Expanded(
                child: ListView.builder(
              physics: const RangeMaintainingScrollPhysics(),
              itemCount: 3, // Number of items in the list
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(16),
                    color: Pallete.blackColor,
                    border: Border.all(color: Pallete.whiteColor),
                  ),
                  margin: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'id ${index + 1}',
                        style: const TextStyle(
                            fontSize: 24, color: Pallete.whiteColor),
                      ),
                    ),
                  ),
                );
              },
            )),
            GestureDetector(
              onTap: null,
              child: Container(
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(16),
                  color: Pallete.whiteColor,
                ),
                margin: const EdgeInsets.all(16.0),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'add id',
                      style: TextStyle(fontSize: 24, color: Pallete.blackColor),
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
