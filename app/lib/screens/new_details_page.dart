import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String email;

  const DetailsPage({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isMasked = true;
  final LocalAuthentication auth = LocalAuthentication();
  isSupported() async {
    bool isBiometricSupported = await auth.isDeviceSupported();
    print(isBiometricSupported.toString());
    return isBiometricSupported;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 70;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'proto.app',
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.normal),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.white,
            height: 1.0,
          ),
        ),
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
                    const Padding(
                      padding: EdgeInsets.all(
                          16.0), // Replace with your desired padding
                      child: Text(
                        'proto.id',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Divider(
                        color: Colors.white, // Set divider color
                        thickness: 2, // Set divider thickness
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                          12.0), // Replace with your desired padding
                      child: GestureDetector(
                        onTap: () {
                          isSupported();
                          setState(() {
                            _isMasked = !_isMasked;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              'name: ' "${widget.name}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                          12.0), // Replace with your desired padding
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMasked = !_isMasked;
                          });
                        },
                        child: Row(
                          children: [
                            const Text(
                              'DOB: ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Text(
                              widget.email,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          70, 12, 0, 0), // Replace with your desired padding
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMasked = !_isMasked;
                          });
                        },
                        child: Row(
                          children: [
                            const Text(
                              '1234-',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              _isMasked ? '0000-0000' : '5678-9012',
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
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Container(
                constraints:
                    const BoxConstraints.tightFor(width: 250, height: 250.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMasked = !_isMasked;
                      });
                    },
                    child: _isMasked
                        ? const Text(
                            'tap to reveal QR',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        : null,
                    // : Image.asset('assets/images/qr.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
