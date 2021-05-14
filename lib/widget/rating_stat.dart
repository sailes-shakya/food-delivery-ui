import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingStart extends StatelessWidget {
  int rating;
  RatingStart(this.rating);

  @override
  Widget build(BuildContext context) {
    List<Widget> stat=[];
    for(int i=0;i<rating;i++)
      {
        stat.add(
          Icon(Icons.star,color: Color(0xffFFD700),size: 20,)
        );
      }
    return Row(
      children: stat,
    );
  }
}
