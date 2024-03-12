import 'dart:async';
import 'dart:convert';

import 'package:app/screens/forms_screen.dart';
import 'package:app/widgets/protoAppBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

const redundant_url =
    'https://63c2-59-152-80-69.ngrok-free.app/api/auth/upload/';

class FileUploadPage extends StatefulWidget {
  final String token;

  const FileUploadPage({Key? key, required this.token}) : super(key: key);

  @override
  _FileUploadPageState createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  late StreamController<Map<String, dynamic>> _controller;
  File? _pickedImage;
  TextEditingController _idTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = StreamController<Map<String, dynamic>>.broadcast();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  Future<void> _chooseImage(BuildContext context) async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose an option"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (imageSource != null) {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: imageSource);
      if (pickedImage != null) {
        setState(() {
          _pickedImage = File(pickedImage.path);
        });
      }
    }
  }

  Future<void> _pickFile(BuildContext context, String idTitle) async {
    if (_pickedImage != null) {
      try {
        // Create a multipart request for uploading the file
        var request =
            http.MultipartRequest('POST', Uri.parse(redundant_url + idTitle));

        // Add the JWT token to the request header
        request.headers['Authorization'] = 'Bearer ${widget.token}';

        // Add the image file to the request
        request.files
            .add(await http.MultipartFile.fromPath('file', _pickedImage!.path));

        // Send the request
        var response = await request.send();

        // Check the response
        if (response.statusCode == 200) {
          // File uploaded successfully
          print('File uploaded successfully');
        } else {
          // File upload failed
          print('File upload failed with status ${response.statusCode}');
        }
      } catch (error) {
        // Handle any errors that occur during the process
        print('Error uploading file: $error');
      }
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: protoAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  'Add Other ID',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: GestureDetector(
                  onTap: () => {
                    // open file selection / camera
                    _chooseImage(context)
                  },
                  child: Container(
                    height: 200, // Set the desired height here
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // Set border color here
                        width: 1, // Set border width here
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _pickedImage == null
                            ? [
                                Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "/",
                                    style: TextStyle(
                                      fontSize: 50,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.document_scanner,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ]
                            : [Image.file(_pickedImage!)],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextField(
                  controller: _idTitleController,
                  decoration: InputDecoration(
                    hintText: 'ID Title',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      color: Colors.white),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          return Colors.white;
                        }),
                        elevation: MaterialStateProperty.all(0)),
                    onPressed: () {
                      // Check if an image is already selected
                      if (_pickedImage != null) {
                        // Call _pickFile method with the ID title entered by the user
                        _pickFile(context, _idTitleController.text);
                      } else {
                        // Inform the user to select an image
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select an image.')),
                        );
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
