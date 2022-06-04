import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:police_app/screens/licence_details.dart';
import 'package:police_app/screens/officer_dashboard.dart';

import '../components/firebaseApi.dart';

class StrikeFine extends StatefulWidget {
  const StrikeFine({Key? key}) : super(key: key);

  @override
  State<StrikeFine> createState() => _StrikeFineState();
}

class _StrikeFineState extends State<StrikeFine> {
  int _currentStep = 0;
  int _index = 0;
  TextEditingController location = new TextEditingController();
  TextEditingController witness = new TextEditingController();
  String continueButton = "Continue";

  File? imageFile;
  var _image;
  String dropdownValue = 'A = 3000/=';
  String imageText = "Select Image";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LicenceDetails();
                    },
                  ),
                ),
              },
              color: Colors.black,
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Text(
                    "Strike Fine",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Stepper(
                    controlsBuilder: (context, details) {
                      return Row(
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                                print(_index);
                                if (_index == 3) {
                                  if (location.text.length > 0 && witness.text.length > 0 && _image.toString().length > 0) {
                                    createFine();
                                  }
                                }
                                if (_index < 3) {
                                  setState(() {
                                    _index += 1;
                                    if (_index == 3) {
                                      continueButton = "Save";
                                    }
                                  });
                                }
                              },
                              child: Text(continueButton)),
                          TextButton(
                              onPressed: () {
                                if (_index > 0) {
                                  setState(() {
                                    _index -= 1;
                                    if (_index != 3) {
                                      continueButton = "Continue";
                                    }
                                  });
                                }
                              },
                              child: const Text("Back"))
                        ],
                      );
                    },
                    currentStep: _index,
                    steps: [
                      Step(
                        title: const Text(
                          "Violation Category",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: DropdownButton(
                          value: dropdownValue,
                          items: <String>['A = 3000/=', 'B = 4000/=', 'C = 5000/='].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                      Step(
                        title: const Text(
                          "Add Evidence",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: ElevatedButton(onPressed: () => _imgFromGallery(), child: Text(imageText)),
                      ),
                      Step(
                        title: const Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: TextFormField(
                          controller: location,
                        ),
                      ),
                      Step(
                        title: const Text(
                          "Whitness ID",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: TextFormField(
                          controller: witness,
                        ),
                      ),
                    ],
                    onStepTapped: (int newIndex) {
                      setState(() {
                        _index = newIndex;
                        if (_index == 3) {
                          continueButton = "Save";
                        } else {
                          continueButton = "Continue";
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _imgFromGallery() async {
    final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
        _image = File(pickedImage.path);
        imageText = "Selected";
      });
    }
  }

  void createFine() async {
    await FirebaseFirestore.instance.collection('violation').add({
      'fine': dropdownValue,
      'loaction': location.text,
      'witness id': witness.text,
      'date': DateTime.now().toString(),
      'payment': false,
    }).then((value) async {
      var newPath = value.id;
      var task = FirebaseApi.uploadFile('Evidence/$newPath', imageFile!);
      final snapshot = await task!.whenComplete(() {});

      final url = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('violation').doc(value.id).update({
        'evidence': url,
      }).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LicenceDetails();
            },
          ),
        );
      });
    });
  }
}
