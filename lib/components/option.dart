import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: (){},
        icon: Icon(Icons.share)),
        SizedBox(width: 20,),
      Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Text('Lecture',style: TextStyle(color: Colors.white),),
            Icon(Icons.play_arrow,color: Colors.white,),
          ],
        ),
      ),
        SizedBox(width: 20,),
        IconButton(onPressed: (){},
        icon: Icon(Icons.download)),
      ],
    );
  }
}
