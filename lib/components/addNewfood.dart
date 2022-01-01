import 'package:flutter/material.dart';
import 'package:foodtoday/design/colors.dart';
import 'package:foodtoday/providers/foodProvider.dart';
import 'package:provider/provider.dart';

class AddNewFood extends StatefulWidget {
  const AddNewFood({Key? key}) : super(key: key);

  @override
  _AddNewFoodState createState() => _AddNewFoodState();
}

class _AddNewFoodState extends State<AddNewFood> {
  // late String value;
  final nameController = new TextEditingController();
  final categoryController = new TextEditingController();
  final _keyform = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Add New Food',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: cBlue, fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Form(
                key: _keyform,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "food name",
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
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter category';
                        }
                        return null;
                      },
                      controller: categoryController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "category",
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
                  ],
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (_keyform.currentState!.validate()) {
                    Provider.of<FoodProvider>(context, listen: false)
                        .addFood(nameController.text, categoryController.text);
                    Navigator.pop(context);
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
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: cBlue),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
