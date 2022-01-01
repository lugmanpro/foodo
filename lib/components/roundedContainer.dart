import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final String number;
  final double width, height;
  const RoundedContainer(
      {Key? key,
      required this.number,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.amber[200]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
        child: Text(
          number,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
