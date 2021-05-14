
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/RestaurantScreen.dart';
import 'package:flutter_food_delivery_ui/widget/rating_stat.dart';

class Nearby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Nearby Restaurant",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        singleRest(context),
      ],
    );
  }

  Widget singleRest(context) {
    List<Widget> rr = [];
    restaurants.forEach((Restaurant restaurant) {
      rr.add(GestureDetector(
        onTap: ()=>Navigator.push(context ,
            MaterialPageRoute(builder: (_)=>RestaurantScreen(restaurant:restaurant))),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey)),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: restaurant.imageUrl,
                      child: Image.asset(
                        restaurant.imageUrl,
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingStart(restaurant.rating),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          restaurant.address,
                          style:
                              TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text("0.2 away",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          overflow: TextOverflow.ellipsis,

                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ));
    });
    return Column(
      children: rr,
    );
  }
}
