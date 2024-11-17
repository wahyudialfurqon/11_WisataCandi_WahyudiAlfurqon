import 'package:flutter/material.dart';
import 'package:wisata_candi_wahyu/models/candi.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Candi> favorites;

  const FavoriteScreen({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Candi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: favorites.isEmpty
            ? const Center(child: Text('No favorites added yet'))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final candi = favorites[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            candi.imageAsset,
                            width: double.infinity,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            candi.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}