import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivers_app/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drivers_app/screens/driver_dashboard.dart';
import 'package:intl/intl.dart';

class DriverProfile extends StatefulWidget {
  const DriverProfile({Key? key}) : super(key: key);

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
  String active = "";
  @override
  void initState() {
    print(StaticData.userId);
    super.initState();
  }

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
                      return const DriverDashboard();
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
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance.collection('driver').doc(StaticData.userId).snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var userDocument = snapshot.data!;
                    if (userDocument['active'] == true) {
                      active = "Active";
                    } else {
                      active = "Deactivated";
                    }

                    Timestamp t = userDocument['expire'];
                    DateTime d = t.toDate();
                    String formattedDate = DateFormat('dd/MM/yyyy').format(d);

                    return Column(
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
                              color: const Color(0xFF3EA2F9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          userDocument['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 10),

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
                        Text(
                          "NIC: \n" + userDocument['nic'] + "",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Blood group: \n" + userDocument['blood_group'] + "",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Address: \n" + userDocument['address'] + "",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Phone: \n+94 " + userDocument['phone'] + "",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          "Status: \n" + active + "",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Expire: \n" + formattedDate + "",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
