import 'package:drivers_app/screens/support_page.dart';
import 'package:flutter/material.dart';

class CantAccessAcc extends StatelessWidget {
  const CantAccessAcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Can't access account? ",
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Montserrat',
            fontSize: 16,
          ),
        ),
        GestureDetector(
          child: const Text(
            "Support",
            style: TextStyle(
              color: Color(0xFF3EA2F9),
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SupportPage();
                },
              ),
            ),
          },
        ),
      ],
    );
  }
}
