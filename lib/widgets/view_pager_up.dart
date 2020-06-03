import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesshop/core/const.dart';
import 'package:shoesshop/models/shoe_model.dart';
import 'package:shoesshop/pages/detailes_page.dart';
import 'package:shoesshop/widgets/app_clipper.dart';
import 'dart:math' as math;

class ShoesCategories extends StatefulWidget {
  @override
  _ShoesCategoriesState createState() => _ShoesCategoriesState();
}

class _ShoesCategoriesState extends State<ShoesCategories> {
  var _shoes = ShoeModel.list;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .38,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: _shoes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DetailsPage(_shoes[index])));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: _buildCategoriesItems(index),
              ),
            );
          }),
    );
  }

  Widget _buildCategoriesItems(int index) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        ClipPath(
          clipper: AppClipper(cornerSize: 25.0, diagonalHeight: 100.0),
          child: Container(
            color: _shoes[index].color,
            width: MediaQuery.of(context).size.width * .5,
          ),
        ),
        Positioned(
          top: 10.0,
          right: -5.0,
          child: Transform.rotate(
            angle: -math.pi / 12,
            child: Hero(
              tag: _shoes[index].imgPath,
              child: Image(
                height: 100.0,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${_shoes[index].imgPath}"),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(25.0))),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(
                left: 12.0, top: MediaQuery.of(context).size.height * .1),
            width: MediaQuery.of(context).size.width * .3,
            child: Text(
              _shoes[index].name,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .04,
          left: MediaQuery.of(context).size.width * .04,
          child: Text(
            "\$ ${_shoes[index].price}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
