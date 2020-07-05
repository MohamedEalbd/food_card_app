import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcardapp/bloc/liststylecolorbloc.dart';
import 'package:foodcardapp/models/food_item.dart';
import 'package:foodcardapp/splachscreen/splach_screen.dart';
import 'bloc/cart_list_bloc.dart';
import 'card/card_screen.dart';
import 'home/my_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
     Bloc((i) => CartListBloc()),
     Bloc((i) => ColorBloc())],
      child: MaterialApp(
        title: 'Food Card',
        home: SplachScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}












