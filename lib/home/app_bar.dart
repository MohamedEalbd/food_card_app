import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodcardapp/bloc/cart_list_bloc.dart';
import 'package:foodcardapp/card/card_screen.dart';
import 'package:foodcardapp/models/food_item.dart';

class CustomAppBar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          StreamBuilder(
              stream: bloc.ListStream,
              builder: (context, snapShot) {
                List<FoodItem> foodItems = snapShot.data;
                int length = foodItems != null ? foodItems.length : 0;
                return buildCestorDetector(length, context, foodItems);
              })
        ],
      ),
    );
  }
}
GestureDetector buildCestorDetector(
    int length, BuildContext context, List<FoodItem> foodItem) {
  return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Icon(Icons.shopping_cart,size: 40,color: Colors.red[900],),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(length.toString()),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.yellow[400],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      )
  );
}
