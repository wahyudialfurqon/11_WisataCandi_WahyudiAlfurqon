import 'package:flutter/material.dart';
import 'package:wisata_candi_wahyu/models/candi.dart';
import 'package:wisata_candi_wahyu/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  //Deklarasi
  final Candi candi;

  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
  //TODO: 6. Implementasi Route
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(candi: candi),
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: candi.imageAsset,
                child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                candi.imageAsset,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 8,),
              child: Text(candi.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ),
          Padding(padding: EdgeInsets.only(left: 16, bottom: 8),
            child: Text(candi.type,
            style: TextStyle(
              fontSize: 12,
            ),),
          ),
        ],
      ),
    ),
    );
  }
}