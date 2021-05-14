import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/cartScreen.dart';
import 'package:flutter_food_delivery_ui/widget/nearby.dart';
import 'package:flutter_food_delivery_ui/widget/recent_widget.dart';

import '../data/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Food Delivery"),
    leading: IconButton(icon: Icon(Icons.person ,size: 30,), onPressed: (){}),
      actions: [
        FlatButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>Cartscreen()));
        }, child: Text("Cart(${currentUser.cart.length})",style: TextStyle(color: Colors.white),),textColor: Colors.white,)
      ],
    ) ,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(

              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8)
                ),
               hintText: "Search Food or Restaurants",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.8,color: Theme.of(context).primaryColor)
                ),
                suffixIcon: IconButton(icon: Icon(Icons.clear),onPressed: (){},),
                prefixIcon: Icon(Icons.search,size: 30,)

              ),
            ),
          ),
          RecentOrder(),
          Nearby(),
        ],
      ),
    );
  }
}


