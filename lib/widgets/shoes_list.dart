import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesshop/models/shoe_model.dart';
import 'package:shoesshop/pages/detailes_page.dart';

class ShoesList extends StatefulWidget {
  @override
  _ShoesListState createState() => _ShoesListState();
}

class _ShoesListState extends State<ShoesList> {
  var _shoe = ShoeModel.list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _shoe.length,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 16.0 , right: 16.0 ,bottom: 16.0 , top: 6.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DetailsPage(_shoe[index]))
                  );
                },
                child: _buildListItems(index),
              ),
            );
          }),
    );
  }

  Widget _buildListItems(int index){
    return Material(
      elevation: 3.0,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              height: MediaQuery.of(context).size.height * .1,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/${_shoe[index].imgPath}"),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _shoe[index].name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 16.0 , fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .02,),
                    Text(_shoe[index].brand),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text("\$ ${_shoe[index].price}" , style: TextStyle(fontSize: 22.0 , fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
