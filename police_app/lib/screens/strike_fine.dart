import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:police_app/screens/licence_details.dart';
import 'package:police_app/screens/officer_dashboard.dart';

class StrikeFine extends StatefulWidget {
  const StrikeFine({Key? key}) : super(key: key);

  @override
  State<StrikeFine> createState() => _StrikeFineState();
}

class _StrikeFineState extends State<StrikeFine> {
  int _currentStep = 0;
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
                    steps: const [
                      Step(
                        title: Text(
                          "Violation Category",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text("data"),
                      ),
                      Step(
                        title: Text(
                          "Add Evidence",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text("data"),
                      ),
                      Step(
                        title: Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text("data"),
                      ),
                      Step(
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
                        _currentStep = newIndex;
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
}
