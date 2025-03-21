import 'package:flutter/material.dart';
import 'package:animationtest/models/listdata.dart';

class Detail extends StatefulWidget {
  final ListData list;
  final int index;
  const Detail({super.key, required this.list, required this.index});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Detail',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.index,
            child: Image.asset(widget.list.image,width: double.infinity,)),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.list.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                Text(widget.list.description),
              ],
            ),
          )
        ],
      )
    );
  }
}