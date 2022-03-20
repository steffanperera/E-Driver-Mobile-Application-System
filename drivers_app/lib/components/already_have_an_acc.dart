import 'package:drivers_app/screens/login_page.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAcc extends StatelessWidget {
  const AlreadyHaveAnAcc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Already have an account? ",
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Montserrat',
            fontSize: 16,
          ),
        ),
        GestureDetector(
          child: const Text(
            "Login",
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
                  return const LoginPage();
                },
              ),
            ),
          },
        ),
      ],
    );
  }
}
