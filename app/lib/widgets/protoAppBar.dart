import 'package:app/new_home_page.dart/your_id_page.dart';
import 'package:app/screens/file_upload.dart';
import 'package:app/screens/user_ids.dart';
import 'package:flutter/material.dart';

AppBar protoAppBar() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
      child: Text(
        'proto.app',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(25.0), // Increase the height here
      child: Container(
        color: Colors.white,
        height: 1.0,
      ),
    ),
    actions: <Widget>[
      PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: Text('Your IDs'),
                onTap: () => {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => UserIdsPage(token: ,)));
                      })
                    }),
            PopupMenuItem(
              child: Text('Option 2'),
              value: 'option2',
            ),
            PopupMenuItem(
              child: Text('Option 3'),
              value: 'option3',
            ),
          ];
        },
        onSelected: (value) {
          // Handle menu item selection here
          print('Selected: $value');
        },
      ),
    ],
  );
}
