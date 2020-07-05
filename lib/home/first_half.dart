import 'package:flutter/material.dart';
import 'package:foodcardapp/home/app_bar.dart';

import 'category_list_item.dart';

class FirstHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(
            height: 30,
          ),
          title(),
          SizedBox(
            height: 30,
          ),
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .85,
              child: searchBar()),
          SizedBox(
            height: 30,
          ),
          categories(),
        ],
      ),
    );
  }

  Widget title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Food",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        ),
        Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30),
        )
      ],
    );
  }

  Widget searchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.search,
          color: Colors.black45,
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  helperStyle: TextStyle(color: Colors.black87)),
            ))
      ],
    );
  }

  Widget categories() {
    return Container(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Burgers",
            availability: 12,
            selected: true,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Pizza",
            availability: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Rolls",
            availability: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Burgers",
            availability: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Burgers",
            availability: 12,
            selected: false,
          ),
        ],
      ),
    );
  }
}