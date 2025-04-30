import 'package:animationtest/components/mydrawer.dart';
import 'package:animationtest/detail.dart';
import 'package:animationtest/preview.dart';
import 'package:flutter/material.dart';
import 'package:animationtest/models/listdata.dart';
import 'package:animationtest/services/musique.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<ListData> list = []; // Correction : Spécifier List<ListData>

  @override
  void initState() {
    super.initState();
    fetchMusiqueList(); // Appelle la fonction pour récupérer les musiques
  }

  // ✅ Correction de la fonction pour éviter l'erreur de récursion
 Future<void> fetchMusiqueList() async {
  try {
    List<ListData> data = await getMusique() as List<ListData>; // Appelle la fonction du service
    if (data.isEmpty) {
      print("Aucune musique trouvée.");
  } else {
      print("Musiques récupérées : ${data.length}");
    }
    setState(() {
      list = data;
    });
  } catch (e) {
    print("Erreur lors de la récupération des musiques : $e");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Musique', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: list.isEmpty
          ? Center(child: Text('Aucune musique disponible'))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:ListTile(
                    leading: Image.network(item.picture),
                    title: Hero(
                      tag: item.title,
                      child:  Text(item.title)),
                    subtitle: Text(item.artist),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Preview(item: item)));
                    },
                  )
                );
              
              },
            ),
    );
  }
}
