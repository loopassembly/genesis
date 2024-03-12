import 'dart:convert';

import 'package:app/widgets/floatingMenu.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/protoAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';

class DetailsPage extends StatefulWidget {
  final String token;
  DetailsPage({Key? key, required this.token}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isMasked = true;
  String? name;
  String? email;
  String? uniqueNo;
  String? qrLink;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(
        Uri.parse('https://2e5f-103-4-222-252.ngrok-free.app/api/users/me'),
        headers: {'Authorization': 'Bearer ${widget.token}'},
      );
      print("ASDFASDF" + response.body);
      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        setState(() {
          name = userData['data']['user']['name'] as String?;
          email = userData['data']['user']['email'] as String?;
          uniqueNo = userData['data']['user']['UniqueNo'] as String?;
          qrLink = userData['data']['user']['qrlink '] as String?;
        });
      } else {
        throw Exception('Failed to fetch user data');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  Future<void> verifyFingerprint() async {
    if (!_isMasked) {
      setState(() {
        _isMasked = true;
      });
      return;
    }
    final localAuth = LocalAuthentication();
    bool authenticated = false;
    try {
      authenticated = await localAuth.authenticate(
        localizedReason: 'Please authenticate to reveal sensitive information',
        // biometricOnly: true,
      );
    } catch (e) {
      print('Error authenticating: $e');
    }

    if (authenticated) {
      setState(() {
        _isMasked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 70;
    return Scaffold(
      appBar: protoAppBar(),
      floatingActionButton: FloatingMenuButton(
        token: widget.token,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Container(
                constraints:
                    BoxConstraints.tightFor(width: screenWidth, height: 300.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          16.0), // Replace with your desired padding
                      child: Text(
                        'proto.id',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Divider(
                        color: Colors.white, // Set divider color
                        thickness: 2, // Set divider thickness
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          12.0), // Replace with your desired padding
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMasked = !_isMasked;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              'Name: ' + (name ?? ''),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          12.0), // Replace with your desired padding
                      child: GestureDetector(
                        onTap: verifyFingerprint,
                        child: Row(
                          children: [
                            Text(
                              'Email: ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Flexible(
                              // Wrap the email text in a Flexible widget
                              child: Text(
                                email ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  backgroundColor: _isMasked
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          70, 12, 0, 0), // Replace with your desired padding
                      child: GestureDetector(
                        onTap: () {
                          verifyFingerprint();
                        },
                        child: Row(
                          children: [
                            Text(
                              '${uniqueNo?.substring(0, 4) ?? ''}-',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              _isMasked
                                  ? '0000-0000'
                                  : '${uniqueNo?.substring(4, 8) ?? ''}-${uniqueNo?.substring(8, 12) ?? ''}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                backgroundColor: _isMasked
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Container(
                constraints: BoxConstraints.tightFor(width: 250, height: 250.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Center(
                    child: GestureDetector(
                  onTap: verifyFingerprint,
                  child: GestureDetector(
                    onTap: verifyFingerprint,
                    child: _isMasked
                        ? Text(
                            'Tap to reveal QR',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        : Image.network(
                            qrLink ?? '',
                            fit: BoxFit
                                .contain, // Adjust this based on your image requirements
                          ),
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
