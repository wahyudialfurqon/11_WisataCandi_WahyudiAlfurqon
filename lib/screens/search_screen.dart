
import 'package:flutter/material.dart';
import 'package:wisata_candi_wahyu/data/candi_data.dart';
import 'package:wisata_candi_wahyu/models/candi.dart';
import 'package:wisata_candi_wahyu/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
  //TODO: 1. Deklarasi variable yang dibutuhkan
  List<Candi> filteredCandis = candiList;
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listener untuk memperbarui pencarian saat pengguna mengetik
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
        filterCandis();
      });
    });
  }

  // Fungsi untuk menyaring daftar candi berdasarkan query
  void filterCandis() {
    setState(() {
      filteredCandis = candiList
          .where((candi) =>
              candi.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. AppBar dengan judul Pencarian Candi
      appBar: AppBar(
        title: const Text('Pencarian Candi'),
      ),
      //TODO: 3. Body berupa Column
      body: Column(
        children: [
          //TODO: 4. TextField untuk input pencarian
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple,
              ),
              child: TextField(
                controller: _searchController,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Cari Candi',
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          //TODO: 5. ListView hasil pencarian sebagai anak dari Column
          Expanded(
            child: ListView.builder(
              itemCount: filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = filteredCandis[index];
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
                    margin: const EdgeInsets.symmetric(horizontal: 16,
                    vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              candi.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(candi.name,
                                style: const TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(candi.location),
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}