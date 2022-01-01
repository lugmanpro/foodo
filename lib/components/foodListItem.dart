import 'package:flutter/material.dart';
import 'package:foodtoday/design/colors.dart';

class FoodListItem extends StatelessWidget {
  final String title;
  final String category;
  final String image;
  late Color color;
  FoodListItem({
    required this.title,
    required this.category,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color == null ? cBrown : color),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    image,
                    width: 130,
                    height: 180,
                    fit: BoxFit.fitHeight,
                  )),
              SizedBox(height: 2),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${category == '' ? 'category' : category}',
                style: TextStyle(color: cBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
