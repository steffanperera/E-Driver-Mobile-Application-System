import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:police_app/screens/officer_dashboard.dart';
import 'package:police_app/staticData.dart';

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
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance.collection('officer').doc(StaticData.loggeduser).snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    var userDocument = snapshot.data!;
                    
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
                         Text(
                         userDocument["name"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                         Text(
                          "Police officer "+userDocument["badge_no"]+" \n"+userDocument["department"]+"",
                          style: const TextStyle(
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
                         Text(
                          "NIC: \n"+userDocument["nic"]+"",
                          style:const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                         Text(
                          "Blood group: \n"+userDocument["blood_group"]+"",
                          style:const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                         Text(
                          "Address: \n"+userDocument["address"]+"",
                          style:const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                         Text(
                          "Phone: \n+94 "+userDocument["phone"].toString()+"",
                          style:const TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                         
                        
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
