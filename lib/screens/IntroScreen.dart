import 'package:flutter/material.dart';
import 'package:foodtoday/Models/Food.dart';
import 'package:foodtoday/components/curvePainter.dart';
import 'package:foodtoday/design/colors.dart';
import 'package:foodtoday/providers/foodProvider.dart';
import 'package:foodtoday/screens/AskYourName.dart';
import 'package:foodtoday/screens/Home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Color.fromRGBO(175, 194, 201, 1)),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
            child: Image.asset('assets/images/Questions-pana.png'),
          ),
          Positioned(
            bottom: 60,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height / 2),
                  painter: CurvePainter(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'What should I cook today?',
                        style: TextStyle(
                            color: cBrown,
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You can ask "),
                          Text(
                            "Foodo",
                            style: TextStyle(color: cOrangeRed),
                          ),
                          Text(" to help you!!"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Foodo",
                            style: TextStyle(color: cOrangeRed),
                          ),
                          Text(" is offline app to help to pick cook decision"),
                        ],
                      ),
                      Text("depend on your list"),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          Provider.of<FoodProvider>(context, listen: false)
                              .initFood();
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? getname = prefs.getString("name");
                          if (getname != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          username: getname,
                                        )));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AskYourNameScreen()));
                          }
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
                              'Get Started',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
