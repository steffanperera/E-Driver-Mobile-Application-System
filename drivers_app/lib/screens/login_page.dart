import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drivers_app/screens/welcome_screen.dart';
import 'package:drivers_app/components/cant_access_acc.dart';
import 'package:drivers_app/screens/driver_dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool isHiddenPassword = true;

  TextEditingController driver_id = TextEditingController();
  TextEditingController password = TextEditingController();

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
                      return const WelcomeScreen();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 100),
                  const Text(
                    "Welcome",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Login to access\n your details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 144),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // input field
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: driver_id,
                            cursorColor: const Color(0xFF3EA2F9),
                            decoration: const InputDecoration(
                              hintText: "Driver ID",
                              hintStyle: TextStyle(
                                color: Color(0xFFB0B0B0),
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter driver id";
                              }
                              return null;
                            },
                            // { validator }
                          ),
                        ),
                        // password field
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: password,
                            obscureText: isHiddenPassword,
                            cursorColor: const Color(0xFF3EA2F9),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                color: Color(0xFFB0B0B0),
                              ),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: const Icon(
                                  Icons.visibility,
                                  color: Color(0xFFB0B0B0),
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 10),
                        // btn - login
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                                backgroundColor: const Color(0xFF3EA2F9),
                              ),
                              onPressed: () => {
                                // if (_formKey.currentState!.validate())
                                //   {
                                //     _getDriver(),
                                //   }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const DriverDashboard();
                                    },
                                  ),
                                ),
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CantAccessAcc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // hide password function
  void _togglePasswordView() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }

  // match driver id to firestore
  // void _getDriver() {
  //   FirebaseFirestore.instance.collection('driver').get().then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       if (doc.id == driver_id.text) {
  //         if (doc["password"] == password.text) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return const DriverDashboard();
  //               },
  //             ),
  //           );
  //         } else {
  //           print("No matching pass");
  //         }
  //       }
  //     });
  //   });
  // }
}
