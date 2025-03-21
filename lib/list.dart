import 'package:animationtest/detail.dart';
import 'package:flutter/material.dart';
import 'package:animationtest/models/listdata.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {



  List<ListData> list = [
    ListData(
      image: "assets/images/shoes3.jpg",
      title: "Addidas", 
      description: "Contrary to popular belief, Lorem Ipsum is not simply, "
    ),
    ListData(
      image: "assets/images/shoes3.jpg",
      title: "Nike", 
      description: "Contrary to popular belief, Lorem Ipsum is not simply"
    ),
    ListData(
      image: "assets/images/shoes3.jpg",
      title: "Puma", 
      description: "Contrary to popular belief, Lorem Ipsum is not simply"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount:list.length ,
        itemBuilder: (context ,index){
          var item = list[index];
          return ListTile(
            leading: Hero(
              tag: item.title,
              child: Image.asset(item.image,)),
            title: Text(item.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            subtitle: Text(item.description),
            onTap: (){
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => Detail(list: item, index: index)));
            },
          );
        })
    );
  }
}