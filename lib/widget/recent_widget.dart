
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

class RecentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("Recent Orders",
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,letterSpacing: 1.6),
          ),
        ),
        Container(
          height: 120,
          color: Colors.white,
          child: ListView.builder(itemBuilder: (context,index){
            return Single(index,context);
          } ,scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20),
            physics: BouncingScrollPhysics(),
          itemCount: currentUser.cart.length,),
        )

      ],

    );
  }

  Widget Single(int index,context) {
    var cart=currentUser.cart[index];
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                    child: Image.asset(cart.food.imageUrl,
                      height: 100,width: 100,fit: BoxFit.cover,)
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cart.food.name,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 4,),
                        Text(cart.restaurant.name,overflow: TextOverflow.ellipsis),
                        SizedBox(height: 4,),
                        Text(cart.date,overflow: TextOverflow.ellipsis)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 20),
            width: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)
            ),
            child: IconButton(icon: Icon(Icons.add),color: Colors.white,onPressed: (){},),
          )
        ],
      ),
    );
  }
}
