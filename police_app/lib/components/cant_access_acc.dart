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
            "Help",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => {},
        ),
      ],
    );
  }
}
