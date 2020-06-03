import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoesshop/models/shoe_model.dart';
import 'package:shoesshop/widgets/app_clipper.dart';
import 'dart:math' as math;

class DetailsPage extends StatefulWidget {
  final ShoeModel _shoe;

  DetailsPage(this._shoe);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget._shoe.color,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Categories"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: AppClipper(cornerSize: 30.0, diagonalHeight: 200.0),
              child: Expanded(
                child: Container(
                  color: Colors.white,
                  height: height * .85,
                ),
              ),
            ),
          ),
          Positioned(
            right: width * .1,
            child: Hero(
              tag: widget._shoe.imgPath,
              child: Transform.rotate(
                angle: -math.pi / 10,
                child: Image(
                  height: height * .25,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/${widget._shoe.imgPath}"),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: height * .165),
              height: height * .47,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: width * .04),
                    width: width * .6,
                    child: Text(
                      widget._shoe.name,
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * .04, top: height * .03),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RatingBar(
                          initialRating: 3.0,
                          minRating: .5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 18.0,
                          unratedColor: Colors.black12,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            );
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: width * .05,
                        ),
                        Text(
                          "120 Review",
                          style:
                              TextStyle(color: Colors.black45, fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * .04, top: height * .03),
                    child: Text(
                      "details".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * .04,
                        top: height * .01,
                        right: width * .04),
                    child: Text(
                      widget._shoe.desc,
                      style: TextStyle(color: Colors.black38, fontSize: 14.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * .04, top: height * .03),
                    child: Text(
                      "color options".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * .04,
                      top: height * .02,),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: height * .05,
                          width: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          height: height * .05,
                          width: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow,
                          ),
                        ),
                        Container(
                          height: height * .05,
                          width: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          height: height * .05,
                          width: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          height: height * .05,
                          width: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35.0),
                  topLeft: Radius.circular(35.0)),
              child: Container(
                padding: EdgeInsets.only(
                    left: width * .1, right: width * .1, top: height * .03),
                height: height * .12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35.0),
                        topLeft: Radius.circular(35.0)),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10.0)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Price",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 16.0,
                              letterSpacing: 1.2),
                        ),
                        Text(
                          "\$ ${widget._shoe.price}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0),
                        ),
                      ],
                    ),
                    Container(
                      height: height * .06,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                          color: widget._shoe.color,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Center(
                        child: Text(
                          "add cart".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
