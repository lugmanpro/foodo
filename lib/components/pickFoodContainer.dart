import 'package:flutter/material.dart';
import 'package:foodtoday/design/colors.dart';

class PickFoodContainer extends StatelessWidget {
  final String title;
  final String image;
  final Function() onPressed;
  PickFoodContainer(
      {Key? key,
      required this.title,
      required this.image,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: cBrownAccent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    'What should I cook?',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 13),
                  InkWell(
                    onTap: onPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        child: Text('Get Answer'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 40,
          child: Image.asset(
            image,
            width: MediaQuery.of(context).size.width / 3,
          ),
        )
      ],
    );
  }
}
