import 'package:flutter/material.dart';
import 'package:foodcardapp/home/my_home.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.red,
        image: DecorationImage(image: AssetImage('images/giphy.gif'),fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "FoodApp",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  splashColor: Colors.orange,
                  child: Text(
                    "Open App",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
