import 'package:flutter/material.dart';
import 'package:foodtoday/RecommendedFoodData.dart';
import 'package:foodtoday/components/addNewfood.dart';
import 'package:foodtoday/components/foodListItem.dart';
import 'package:foodtoday/components/pickFoodContainer.dart';
import 'package:foodtoday/design/colors.dart';
import 'package:foodtoday/providers/foodProvider.dart';
import 'package:foodtoday/screens/AnswerScreen.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  String username;
  HomeScreen({Key? key, this.username = 'user'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var foodData = Provider.of<FoodProvider>(context, listen: true).getFoods;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: cGreenAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/hot-pot.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Foodo',
                              style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 20,
                                  color: cGreenAccent),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hello $username!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 5),
                      Text('What you want to cook today?'),
                      PickFoodContainer(
                          title: 'Ask Me Now!',
                          image: 'assets/images/food.png',
                          onPressed: () {
                            if (foodData.isNotEmpty) {
                              var random = new Random();
                              var randomPick =
                                  foodData[random.nextInt(foodData.length)];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnswerScreen(
                                          selectedFood: randomPick)));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("You should add food first"),
                              ));
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your list',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 290,
                  ),
                  child: foodData.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          itemCount: foodData.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onLongPress: () {
                                Provider.of<FoodProvider>(context,
                                        listen: false)
                                    .deleteFood(foodData[index]);
                              },
                              child: FoodListItem(
                                title: foodData[index].name,
                                image: foodData[index].image,
                                category: foodData[index].category,
                                color: Color.fromRGBO(208, 134, 89, 1),
                              ),
                            );
                          })
                      : Center(child: Text('You did not add yet')),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Recommended',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 320,
                  ),
                  child: recommendedFoodData.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          itemCount: recommendedFoodData.length,
                          itemBuilder: (context, index) {
                            return FoodListItem(
                              title: recommendedFoodData[index].name,
                              image: recommendedFoodData[index].image,
                              category: recommendedFoodData[index].category,
                              color: Color.fromRGBO(255, 203, 174, 1),
                            );
                          })
                      : Text('No Food Here'),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: cOrangeRed,
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => AddNewFood());
            },
          ),
        ),
      ),
    );
  }
}
