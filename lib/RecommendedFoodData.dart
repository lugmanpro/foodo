import 'package:foodtoday/Models/Food.dart';

var imagePath = "assets/images/";
List<Food> recommendedFoodData = [
  new Food(
      name: 'Asian noodles',
      image: imagePath + "asian-noodles.jpg",
      category: "noodles"),
  new Food(
      name: 'Falafel', image: imagePath + "falafel.jpg", category: "Falafel"),
  new Food(
      name: 'Kofta Kebab',
      image: imagePath + 'kofta-kebab.jpg',
      category: 'Kebab'),
  new Food(
      name: 'Stuffed peppers',
      image: imagePath + 'stuffed-peppers.jpg',
      category: 'Stuffed food')
];
