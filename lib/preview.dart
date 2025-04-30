import 'package:animationtest/components/option.dart';
import 'package:flutter/material.dart';
import 'package:animationtest/models/listdata.dart';

class Preview extends StatelessWidget {
  final ListData item;
  const Preview({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Musique', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(item.picture,
              fit: BoxFit.cover,
              ),
              SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Artist :"),
                  SizedBox(width: 10,),
                  Text(item.artist,style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Titre :"),
                  SizedBox(width: 10,),
                  Text(item.title,style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(height: 20,),
              Option(),
             
            ],
          ),
        ),
      ),
    );
  }
}
