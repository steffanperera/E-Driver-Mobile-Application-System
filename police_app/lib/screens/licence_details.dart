import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:police_app/components/driver_card.dart';
import 'package:police_app/screens/officer_dashboard.dart';

class LicenceDetails extends StatefulWidget {
  const LicenceDetails({Key? key}) : super(key: key);

  @override
  State<LicenceDetails> createState() => _LicenceDetailsState();
}

class _LicenceDetailsState extends State<LicenceDetails> {
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
                      return const OfficerDashboard();
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
                    "Licence Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const DriverCard(),
                  const SizedBox(height: 20),
                  // statistics
                  const Text(
                    "Statistics",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: size.width * 0.38,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.only(left: 20),
                            color: const Color(0xFFF5F5F5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  "Due fines",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.04),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: size.width * 0.38,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.only(left: 20),
                            color: const Color(0xFFF5F5F5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  "Total violations",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Actions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // btn - my profile
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return const DriverProfile();
                          //     },
                          //   ),
                          // ),
                        },
                        child: const Text(
                          "Driver profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  // btn - pay fines
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return const PayFines();
                          //     },
                          //   ),
                          // ),
                        },
                        child: const Text(
                          "Strike fine",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  // btn - support
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
                          "History",
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
}