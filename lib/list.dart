import 'package:animationtest/components/mydrawer.dart';
import 'package:animationtest/detail.dart';
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
    List<ListData> data = (await getMusique()) as List<ListData>; // Appelle la fonction du service
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
        title: const Text('List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: MyDrawer(),
      body: list.isEmpty
          ? Center(child: Text('Aucune musique disponible'))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];
                return ListTile(
                  leading: Hero(
                    tag: item.titre, // Correction : utiliser item.titre et non item.Titre
                    child: Image.network(
                      item.picture, // Correction : utiliser item.image et non item.Image
                      width: 100,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    item.titre,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  // subtitle: Text(item.description),
                  onTap: () {
                    
                  },
                );
              },
            ),
    );
  }
}
