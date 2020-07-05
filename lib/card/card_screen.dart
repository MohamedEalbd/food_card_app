import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcardapp/bloc/cart_list_bloc.dart';
import 'package:foodcardapp/bloc/liststylecolorbloc.dart';
import 'package:foodcardapp/main.dart';
import 'package:foodcardapp/models/food_item.dart';

class Cart extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<FoodItem> fooditems;
    return StreamBuilder(
        stream: bloc.ListStream,
        builder: (context, snapShot) {
          if (snapShot.data != null) {
            fooditems = snapShot.data;
            return Scaffold(
              body: SafeArea(
                child: Container(
                  child: CartBody(fooditems),
                ),
              ),
              bottomNavigationBar: BottomBar(fooditems),
            );
          } else {
            return Container();
          }
        });
  }
}

class BottomBar extends StatelessWidget {
  final List<FoodItem> fooditems;

  BottomBar(this.fooditems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(fooditems),
          Divider(
            height: 1,
            color: Colors.grey[700],
          ),
          person(),
          nextButtonBar(),
        ],
      ),
    );
  }
}

Container nextButtonBar() {
  return Container(
    margin: EdgeInsets.only(right: 25),
    padding: EdgeInsets.all(25),
    decoration: BoxDecoration(
        color: Color(0xfffeb324), borderRadius: BorderRadius.circular(15)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "15 - 25 min",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        Text(
          "Next",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
      ],
    ),
  );
}

Container person() {
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.symmetric(vertical: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Person",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
        customPersonWidget()
      ],
    ),
  );
}

Container totalAmount(List<FoodItem> fooditems) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.all(25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Total",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 25,
          ),
        ),
        Text(
          "\$${returnTotalAmount(fooditems)}",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28
          ),
        )
      ],
    ),
  );
}

String returnTotalAmount(List<FoodItem> foodItem){
  double totalAmount = 0;
  for (int i =0; i < foodItem.length; i ++){
    totalAmount = totalAmount + foodItem[i].price * foodItem[i].quantity;
  }
  return totalAmount.toStringAsFixed(2);
}


class CartBody extends StatelessWidget {
  final List<FoodItem> fooditems;

  CartBody(this.fooditems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          title(),
          Expanded(
              flex: 1,
              child: fooditems.length > 0 ? foodItemList() : noItemsContainer())
        ],
      ),
    );
  }

  Container noItemsContainer() {
    return Container(
      child: Center(
        child: Text(
          "No more items in the cart",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              fontSize: 20),
        ),
      ),
    );
  }

  ListView foodItemList() {
    return ListView.builder(
        itemCount: fooditems.length,
        itemBuilder: (builder, index) {
          return CartListItem(foodItem: fooditems[index]);
        });
  }

  Widget title() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "my",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
              ),
              Text(
                "Order",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 35),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  final FoodItem foodItem;

  CartListItem({@required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: foodItem,
      maxSimultaneousDrags: 1,
      child: DraggableChild(foodItem: foodItem),
      feedback: DraggableChildFeedBack(foodItem: foodItem),
      childWhenDragging: foodItem.quantity > 1
          ? DraggableChild(foodItem: foodItem)
          : Container(),
    );
  }
}

class DraggableChild extends StatelessWidget {
  final FoodItem foodItem;

  const DraggableChild({Key key, @required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ItemContent(foodItem: foodItem),
    );
  }
}

class DraggableChildFeedBack extends StatelessWidget {
  final FoodItem foodItem;

  const DraggableChildFeedBack({Key key, @required this.foodItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();
    return Opacity(
      opacity: .7,
      child: Material(
        child: StreamBuilder(
          stream: colorBloc.colorStrem,
          builder: (context,snapShot){
            return Container(
              margin: EdgeInsets.only(bottom: 25),
              child: ItemContent(foodItem: foodItem),
              decoration: BoxDecoration(
                color: snapShot.data !=null ? snapShot.data : Colors.white
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  final FoodItem foodItem;

  ItemContent({@required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              foodItem.imgUrl,
              fit: BoxFit.fitHeight,
              height: 55,
              width: 80,
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(text: foodItem.quantity.toString()),
                  TextSpan(text: 'X'),
                  TextSpan(text: foodItem.title),
                ]),
          ),
          Text(
            "\$ ${foodItem.quantity * foodItem.price}",
            style:
                TextStyle(color: Colors.grey[300], fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        DragTargetWidget(),
      ],
    );
  }
}

class DragTargetWidget extends StatefulWidget {
  @override
  _DragTargetWidgetState createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  final CartListBloc listBloc = BlocProvider.getBloc<CartListBloc>();
  final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();
  @override
  Widget build(BuildContext context) {
    return DragTarget<FoodItem>(
        onWillAccept: (FoodItem foodItems){
          colorBloc.setColor(Colors.red);
          return true;
        },
        onLeave: (FoodItem foofItems){
          colorBloc.setColor(Colors.white);
        },
        onAccept: (FoodItem foodItems){
          listBloc.removeFromList(foodItems);
          colorBloc.setColor(Colors.white);
        },
        builder: (context, incoming, reject) {
      return GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            CupertinoIcons.delete,
            size: 35,
          ),
        ),
        onTap: (){},
      );
    });
  }
}

class customPersonWidget extends StatefulWidget {
  @override
  _customPersonWidgetState createState() => _customPersonWidgetState();
}

class _customPersonWidgetState extends State<customPersonWidget> {
  int noOfPerson = 1;
  double buttonWidth = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey[300], width: 2)),
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: buttonWidth,
            height: buttonWidth,
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    noOfPerson--;
                  });
                },
                child: Text(
                  "-",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                )),
          ),
          Text(
            noOfPerson.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            width: buttonWidth,
            height: buttonWidth,
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    noOfPerson++;
                  });
                },
                child: Text(
                  "+",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}
