import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álbums App',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      home: const AlbumListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({super.key});

  @override
  State<AlbumListPage> createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  final List<String> mockTitles = [
    "Lorem ipsum dolor sit amet",
    "Consectetur adipiscing elit",
    "Sed do eiusmod tempor",
    "Ut labore et dolore magna",
    "Ut enim ad minim veniam",
    "Quis nostrud exercitation",
    "Laboris nisi ut aliquip",
    "Commodo consequat",
    "Duis aute irure dolor",
    "Voluptate velit esse cillum",
    "Eu fugiat nulla pariatur",
    "Excepteur sint occaecat",
    "Cupidatat non proident",
    "Sunt in culpa qui officia",
    "Deserunt mollit anim id est",
    "Labore et dolore magna aliqua",
    "Curabitur non nulla sit amet",
    "Nisl tempus convallis",
    "Praesent sapien massa",
    "Vivamus suscipit tortor eget"
  ];

  final Random _random = Random();
  final Uuid _uuid = const Uuid();
  late final List<Map<String, dynamic>> albums;

  @override
  void initState() {
    super.initState();
    albums = List.generate(60, (index) {
      final title = mockTitles[_random.nextInt(mockTitles.length)];
      return {
        "userId": _uuid.v4(),
        "id": _uuid.v4(),
        "title": title,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Text(
          'Álbums',
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Selecione o álbum para visualizar',
              style: GoogleFonts.robotoMono(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemBuilder: (context, index) {
          final item = albums[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6FF),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                item['title'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
