import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivers_app/screens/payment_page.dart';
import 'package:drivers_app/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'driver_dashboard.dart';

class PayFines extends StatefulWidget {
  const PayFines({Key? key}) : super(key: key);

  @override
  _PayFinesState createState() => _PayFinesState();
}

class _PayFinesState extends State<PayFines> {
  List<Widget> activefines = [];
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Text(
                    "Pay fines",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // due fines
                  const Text(
                    "Fines",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Select from due fines to view details \nand proceed to payment",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // fine (clickable)
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('violation').where('driver', isEqualTo: StaticData.userId).where('payment', isEqualTo: false).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return SizedBox(
                          height: size.height * 0.3,
                          child: ListView(
                            children: snapshot.data!.docs.map((document) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                width: size.width * 0.8,
                                height: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.only(left: 20),
                                      backgroundColor: const Color(0xFFF9AEAE),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    onPressed: () => {
                                      StaticData.fineId = document.id,
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const PaymentPage();
                                          },
                                        ),
                                      ),
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          document['date'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFEA5252),
                                          ),
                                        ),
                                        Text(
                                          "#" + document.id + "",
                                          style: const TextStyle(
                                            color: Color(0xFFEA5252),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            height: 1.6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }),
                  const SizedBox(height: 20),
                  // history
                  const Text(
                    "History",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // payed fine (clickable)
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('violation').where('driver', isEqualTo: StaticData.userId).where('payment', isEqualTo: true).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return SizedBox(
                          height: size.height * 0.4,
                          child: ListView(
                            children: snapshot.data!.docs.map((document) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                width: size.width * 0.8,
                                height: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.only(left: 20),
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
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          document['date'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "#" + document.id + "",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            height: 1.6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
