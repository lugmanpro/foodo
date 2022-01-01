import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:foodtoday/Models/Food.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodProvider with ChangeNotifier {
  List<Food> _foodData = [];

  Future<void> initFood() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove("foodlist");
    var food = prefs.getString("foodlist");
    if (food != null) {
      var decoded = json.decode(food);
      List<Food> list = decoded.map<Food>((e) => Food.fromJson(e)).toList();
      _foodData = list;
    }
    notifyListeners();
  }

  UnmodifiableListView<Food> get getFoods {
    return UnmodifiableListView(_foodData);
  }

  Future<void> addFood(String text, String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final food = new Food(
        name: text,
        image: 'assets/images/background-Item.jpg',
        category: category);
    _foodData.add(food);
    List<Map<String, dynamic>> data = [];
    for (Food food in _foodData) {
      data.add(food.toJson());
    }
    prefs.setString("foodlist", json.encode(data));
    notifyListeners();
  }

  Future<void> deleteFood(Food food) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _foodData.remove(food);
    prefs.setString("foodlist", json.encode(_foodData));
    notifyListeners();
  }
}
