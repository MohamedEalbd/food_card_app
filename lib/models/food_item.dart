
import 'package:flutter/cupertino.dart';

class FoodItem{
  int id;
  String title;
  String hotel;
  String imgUrl;
  double price;
  int quantity;
  FoodItem({
      @required this.id,
      @required this.title,
      @required this.hotel,
      @required this.imgUrl,
      @required this.price,
      this.quantity = 1,
     });
  void incrementQuantity(){
    this.quantity = this.quantity + 1;
  }
  void decrementQuantity(){
    this.quantity = this.quantity - 1;
  }
}
class FoodItemList{
  List<FoodItem> foodItem;

  FoodItemList({@required this.foodItem});

}
FoodItemList foodItemList = FoodItemList(foodItem: [
  FoodItem(
    id: 1,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imgUrl:
    "https://hips.hearstapps.com/pop.h-cdn.co/assets/cm/15/05/480x240/54ca71fb94ad3_-_5summer_skills_burger_470_0808-de.jpg",
  ),
  FoodItem(
    id: 2,
    title: "Kick Ass Burgers",
    hotel: "Dudleys",
    price: 11.99,
    imgUrl:
    "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png",
  ),
  FoodItem(
    id: 3,
    title: "Supreme Pizza Burger",
    hotel: "Golf Course",
    price: 8.49,
    imgUrl: "https://images.pexels.com/photos/2741457/pexels-photo-2741457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  FoodItem(
    id: 4,
    title: "Chilly Cheeze Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imgUrl: "https://images.pexels.com/photos/2983098/pexels-photo-2983098.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  FoodItem(
    id: 5,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imgUrl: "https://images.pexels.com/photos/3821692/pexels-photo-3821692.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  FoodItem(
    id: 6,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imgUrl:
    "https://cdn.pixabay.com/photo/2018/03/04/20/08/burger-3199088__340.jpg",
  ),
]);