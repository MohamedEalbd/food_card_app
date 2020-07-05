import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodcardapp/bloc/cart_list_bloc.dart';
import 'package:foodcardapp/models/food_item.dart';


class Items extends StatelessWidget {
  final String hotel;
  final String itemName;
  final double itemPrice;
  final String imageUrl;
  final bool leftAlign;

  Items(
      {@required this.hotel,
        @required this.itemName,
        @required this.itemPrice,
        @required this.imageUrl,
        @required this.leftAlign});

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerPaddingRadious = 10;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: leftAlign ? 0 : containerPadding,
              right: leftAlign ? containerPadding : 0),
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                      left: leftAlign
                          ? Radius.circular(0)
                          : Radius.circular(containerPaddingRadious),
                      right: leftAlign
                          ? Radius.circular(containerPaddingRadious)
                          : Radius.circular(0),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: leftAlign ? 20 : 0,
                  right: leftAlign ? 0 : 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                              itemName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
                        Text(
                          "\$ $itemPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(text: "by "),
                                TextSpan(
                                    text: hotel,
                                    style: TextStyle(fontWeight: FontWeight.w700))
                              ])),
                    ),
                    SizedBox(
                      height: containerPadding,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ItemContainer extends StatefulWidget {
  final FoodItem foodItem;

  ItemContainer({this.foodItem});

  @override
  _ItemContainerState createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCard(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCard(widget.foodItem);
        final snackBar = SnackBar(
          content: Text("${widget.foodItem.title} added to  the cart"),
          duration: Duration(milliseconds: 550),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        hotel: widget.foodItem.hotel,
        itemName: widget.foodItem.title,
        itemPrice: widget.foodItem.price,
        imageUrl: widget.foodItem.imgUrl,
        leftAlign: (widget.foodItem.id % 2 == 0) ? true : false,
      ),
    );
  }
}