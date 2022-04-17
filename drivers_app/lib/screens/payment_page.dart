import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drivers_app/screens/pay_fines.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
                      return const PayFines();
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
                    "Proceed to payment",
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
                    "To complete payment please select \nyour payment method",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: size.width * 0.8,
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: const Color(0xFFEAFFF3),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Rs 4,000/=",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0DC171),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "#163426282",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0DC171),
                                  fontSize: 18,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "2022-03-04 12:31:00",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF0DC171),
                                ),
                              ),
                            ],
                          ),
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