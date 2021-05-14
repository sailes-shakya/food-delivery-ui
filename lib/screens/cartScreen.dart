import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';

class Cartscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart (${currentUser.cart.length})"),),
      body: ListView.separated(itemCount: currentUser.cart.length+1,
          separatorBuilder: (context,index){
            return Divider();
          },
          itemBuilder: (context,index){
        if(index<currentUser.cart.length)
          return buildcart(index,context);
        else{
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Estimated Delivery Time "),
                    Text("25 min ")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Cost"),
                    Text('\$ ${gettotal().toStringAsFixed(2)}')
                  ],
                ),
                Container(height: 100,)
              ],
            ),
          );
        }
      }),
      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: FlatButton(
          onPressed: (){},
          child: Text("Checkout",style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }

  Widget buildcart(int index,context) {
    Food food=currentUser.cart[index].food;
    return Row(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(food.imageUrl),
              fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
       Expanded(
         child: Container(
           padding:EdgeInsets.all(10),
           child: Column(children: [
             Text(food.name,style: TextStyle(fontSize: 20,)),
             Text(currentUser.cart[index].restaurant.name),
             SizedBox(height: 10,),
             Container(
               width: 100,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 border: Border.all(
                   width: 1,
                   color: Colors.black54
                 )
               ),
               child: Padding(
                 padding: const EdgeInsets.all(.0),
                 child: Row(mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   GestureDetector(onTap: (){},child: Text("-",style: TextStyle(color: Theme.of(context).primaryColor),)),
                   Text(currentUser.cart[index].quantity.toString(),style: TextStyle(fontSize: 16)),
                   GestureDetector(onTap: (){},child: Text("+",style: TextStyle(color: Theme.of(context).primaryColor),))
                 ],
                 ),
               ),
             )
           ],),
         ),
       ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('\$ ${currentUser.orders[index].quantity * currentUser.orders[index].food.price}'),
        )
      ],
    );
  }

  double gettotal() {
    double price=0;
     currentUser.cart.forEach((element) {
       price+=element.quantity*element.food.price;
     });
     return price;
  }
}
