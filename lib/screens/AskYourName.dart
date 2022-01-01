import 'package:flutter/material.dart';
import 'package:foodtoday/components/curvePainter.dart';
import 'package:foodtoday/design/colors.dart';
import 'package:foodtoday/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AskYourNameScreen extends StatelessWidget {
  AskYourNameScreen({Key? key}) : super(key: key);
  final username = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/hello.png',
                  width: MediaQuery.of(context).size.width,
                ),
                Text(
                  'What is your name?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Almost there! Before we start, give us'),
                Text('your name please'),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    // key: _formKey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: username,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Your name",
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("name", username.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(username: username.text)));
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
                        'Start Now',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
