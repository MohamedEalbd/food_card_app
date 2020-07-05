import 'package:flutter/material.dart';
import 'package:foodcardapp/models/food_item.dart';
import 'first_half.dart';
import 'items.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
                FirstHalf(),
                SizedBox(
                  height: 45,
                ),
                for (var foodItem in foodItemList.foodItem)
                  ItemContainer(foodItem: foodItem),
              ],
            ),
          )),
    );
  }
}