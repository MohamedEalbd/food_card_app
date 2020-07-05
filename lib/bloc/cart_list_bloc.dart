import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:foodcardapp/bloc/provider.dart';
import 'package:foodcardapp/models/food_item.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listCounter = BehaviorSubject<List<FoodItem>>.seeded([]);

  CardProvider provider = CardProvider();

// output
  Stream<List<FoodItem>> get ListStream => _listCounter.stream;

  // input
  Sink<List<FoodItem>> get ListSink => _listCounter.sink;

 addToList(FoodItem foodItem){
   ListSink.add(provider.addToList(foodItem));
 }

  removeFromList(FoodItem foodItem){
    ListSink.add(provider.removeFromList(foodItem));
  }

  @override
  // ignore: must_call_super
  void dispose() {
    // will be called automatically
    _listCounter.close();
    super.dispose();
  }
}
