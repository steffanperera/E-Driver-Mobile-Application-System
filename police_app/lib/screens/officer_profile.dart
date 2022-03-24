import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:police_app/screens/officer_dashboard.dart';

class OfficerProfile extends StatefulWidget {
  const OfficerProfile({Key? key}) : super(key: key);

  @override
  State<OfficerProfile> createState() => _OfficerProfileState();
}

class _OfficerProfileState extends State<OfficerProfile> {
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
                  // avatar
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "T D Wijegunasinghe",
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
                    "Police officer #369 \nWattala department",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // details
                  const Text(
                    "Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "NIC: \n851000000v",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Blood group: \nO+",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Address: \nNo 20, Wattala Road, Wattala",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Phone: \n+94 711000000",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Status: \nActive",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
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
}
