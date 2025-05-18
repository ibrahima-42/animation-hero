import 'package:animationtest/components/option.dart';
import 'package:animationtest/services/musique.dart';
import 'package:flutter/material.dart';
import 'package:animationtest/models/listdata.dart';
import 'package:animationtest/models/track.dart';

class Preview extends StatefulWidget {
  final ListData item;
  const Preview({super.key, required this.item});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {

 late Future<List<Track>> futureTracks;

 @override

initState() {
  super.initState();
  futureTracks = fetchTrack(widget.item.tracklist);
}

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(widget.item.picture,
              fit: BoxFit.cover,
              ),
              SizedBox(height: 20,),
              Option(),
              SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Artist :"),
                  SizedBox(width: 10,),
                  Text(widget.item.artist,style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Titre :"),
                  SizedBox(width: 10,),
                  Text(widget.item.title,style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              
              
              SizedBox(height: 25,),
              FutureBuilder(
                future: futureTracks,
                builder: (context , snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data![index];
                          return ListTile(
                            title: Text(item.title,style: TextStyle(fontSize: 13),),
                            leading: Image.network(widget.item.picture,width: 30,height: 30,fit: BoxFit.cover,),
                            // trailing: Icon(Icons.menu),
                            // subtitle: Text(item.duration.toString()),
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => Preview(item: item)));
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
              )
            ],
          ),
        ),
      );
  }
}

    