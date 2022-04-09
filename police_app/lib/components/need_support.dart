import 'package:flutter/material.dart';
import 'package:police_app/screens/officer_help.dart';

class NeedSupport extends StatelessWidget {
  const NeedSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Need support logging in? ",
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
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OfficerHelp();
                },
              ),
            ),
          },
        ),
      ],
    );
  }
}
