import 'package:flutter/material.dart';
import 'package:shoesshop/core/const.dart';
import 'package:shoesshop/core/flutter_icons.dart';
import 'package:shoesshop/widgets/shoes_list.dart';
import 'package:shoesshop/widgets/view_pager_up.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          size: 28.0,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.blueColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active , size: 25.0,),
            title: Text("Alarm")
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.favorite , size: 25.0,),
              title: Text("Favorites"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person , size: 25.0,),
            title: Text("Profile"),
          ),

        ]
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0 , right: 16.0 , bottom: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 26.0),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.black54,
                      size: 30.0,
                    ))
              ],
            ),
          ),
          ShoesCategories(),
          Padding(
            padding: EdgeInsets.only(left: 16.0 , right: 16.0 , top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "JUST FOR YOU",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    )),
              ],
            ),
          ),
          ShoesList(),
        ],
      ),
    );
  }
}
