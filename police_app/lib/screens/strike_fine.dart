import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:police_app/screens/licence_details.dart';
import 'package:police_app/screens/officer_dashboard.dart';

class StrikeFine extends StatefulWidget {
  const StrikeFine({Key? key}) : super(key: key);

  @override
  State<StrikeFine> createState() => _StrikeFineState();
}

class _StrikeFineState extends State<StrikeFine> {
  int _currentStep = 0;
  int _index = 0;

  File? imageFile;
  var _image;
  String dropdownValue = 'A = 3000/=';
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
                    currentStep: _index,
                    onStepCancel: () {
                      if (_index > 0) {
                        setState(() {
                          _index -= 1;
                        });
                      }
                    },
                    onStepContinue: () {
                      if (_index <= 0) {
                        setState(() {
                          _index += 1;
                        });
                      }
                    },
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
                        title:const Text(
                          "Add Evidence",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: ElevatedButton(onPressed: () => _imgFromGallery(), child:const  Text("Capture")),
                      ),
                      const Step(
                        title: Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text("data"),
                      ),
                      const Step(
                        title: Text(
                          "Whitness ID",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text("data"),
                      ),
                    ],
                    onStepTapped: (int newIndex) {
                      setState(() {
                        _index = newIndex;
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
      });
    }
  }
}
