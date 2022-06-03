import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:police_app/screens/licence_details.dart';
import 'package:police_app/screens/login_page.dart';
import 'package:police_app/screens/officer_profile.dart';
import 'package:police_app/staticData.dart';

class OfficerDashboard extends StatefulWidget {
  const OfficerDashboard({Key? key}) : super(key: key);

  @override
  State<OfficerDashboard> createState() => _OfficerDashboardState();
}

class _OfficerDashboardState extends State<OfficerDashboard> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

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
                      return const LoginPage();
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
                    "Dashboard",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Scan licence to access driver's profile",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Image.asset(
                    'assets/images/frame.png',
                  ),
                  const SizedBox(height: 70),
                  // btn - complete scan
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          backgroundColor: Colors.black,
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () => {
                          // _tagRead(),

                          StaticData.driverId='d001',

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LicenceDetails();
                              },
                            ),
                          )
                        },
                        child: const Text(
                          "Complete scan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  // btn - officer profile
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          backgroundColor: const Color(0xFFF5F5F5),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const OfficerProfile();
                              },
                            ),
                          ),
                        },
                        child: const Text(
                          "Officer profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  // btn - sign out
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          backgroundColor: const Color(0xFFF5F5F5),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () => {},
                        child: const Text(
                          "Support",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      var licence = result.value;
      print(licence);
      StaticData.passengerLisence = licence.toString();

      bool exist = false;
      //Find User
      await FirebaseFirestore.instance.collection("driver").where("nfc", isEqualTo: licence).get().then((res) {
        print(res.docs.length);

        if (res.docs.length > 0) {
          for (int a = 0; a < res.docs.length; a++) {
            print(res.docs[0].id);
            StaticData.driverId = res.docs[0].id;
            exist = true;
          }
        }
      });

      if (exist = true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LicenceDetails();
            },
          ),
        );
      }

      NfcManager.instance.stopSession();
    });
  }
}
