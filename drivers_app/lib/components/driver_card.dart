import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: size.width * 0.8,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color(0xFF3EA2F9),
        ),
      ),
    );
  }
}
