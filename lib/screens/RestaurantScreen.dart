import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widget/rating_stat.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.fill,

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
                      Navigator.pop(context);
                    }
                      ,
                      color: Colors.white,
                      iconSize: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.restaurant.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("0.2 miles Away"),
              ],),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: RatingStart(widget.restaurant.rating),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(widget.restaurant.address),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child:
                  Text("Review",
                    style: TextStyle(fontSize: 16, color: Colors.white),)),
              FlatButton(onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child:
                  Text("Contact",
                    style: TextStyle(fontSize: 16, color: Colors.white),))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Menu", style: TextStyle(fontSize: 22, color: Colors.black)),
            ],
          ),
          Expanded(
            child: GridView.count(crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return Stack(
                  alignment:Alignment.center ,
                  children: [
                    Container(
                      height: 175,
                      width: 175,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(food.imageUrl),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                        height: 175,
                        width: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(begin: Alignment.topRight
                          ,end: Alignment.bottomLeft,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.black87.withOpacity(0.3),
                              Colors.black54.withOpacity(0.3),
                              Colors.black38.withOpacity(0.3)
                            ],
                            stops:
                              [0.1,0.4,.6,.9]
                          )
                        )
                    ),

                    Positioned(
                      bottom: 65,
                      child: Column(
                        children: [
                          Text(food.name,style: TextStyle(fontSize: 22,color: Colors.white),),
                          Text('\$ ${food.price.toString()}',style:TextStyle(fontSize: 20,color: Colors.white)),
                        ],
                      ),
                    ),

                    Positioned(
                      child: Container(
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.add,color: Colors.white,),
                          onPressed: (){},
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      right: 10,
                      bottom: 10,
                    )
                  ],
                );
              }),),
          )
        ],
      ),
    );
  }
}
