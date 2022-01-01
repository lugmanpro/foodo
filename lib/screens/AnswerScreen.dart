import 'package:flutter/material.dart';
import 'package:foodtoday/Models/Food.dart';
import 'package:foodtoday/components/curvePainter.dart';
import 'package:foodtoday/design/colors.dart';

class AnswerScreen extends StatelessWidget {
  final Food selectedFood;
  const AnswerScreen({Key? key, required this.selectedFood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Image.asset(
            selectedFood.image,
          ),
          Positioned(
              bottom: 60,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height +
                    (MediaQuery.of(context).size.height / 1.5),
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height / 1.5),
                  painter: CurvePainter(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          selectedFood.name,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.brown),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Here, I picked this food for you',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("I hope its good choice, enjoy!"),
                          ],
                        ),
                        Text("You can ask me again if you want"),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cOrangeRed),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Done',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
