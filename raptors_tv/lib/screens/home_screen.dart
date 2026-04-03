import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/video_service.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Category> _categories = [];
  List<Category> _filteredCategories = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final videoService = VideoService();
      final categories = await videoService.loadVideos();
      setState(() {
        _categories = categories;
        _filteredCategories = List.from(_categories);
        _tabController = TabController(length: _categories.length, vsync: this);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erreur: $e';
        _isLoading = false;
      });
    }
  }

  void _filterVideos(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = List.from(_categories);
      } else {
        _filteredCategories = _categories.map((cat) {
          final filteredVideos = cat.videos
              .where((video) => video.title.toLowerCase().contains(query.toLowerCase()))
              .toList();
          return Category(category: cat.category, videos: filteredVideos);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Raptors TV')),
        body: Center(
          child: Text(_errorMessage),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Raptors TV'),
        centerTitle: true,
        elevation: 4,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          tabs: _categories.map((cat) => Tab(text: cat.category)).toList(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher un documentaire...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterVideos('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onChanged: _filterVideos,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _filteredCategories.map((cat) {
                if (cat.videos.isEmpty) {
                  return Center(
                    child: Text(
                      'Aucune vidéo trouvée pour "${cat.category}"',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: cat.videos.length,
                  itemBuilder: (context, index) {
                    final video = cat.videos[index];
                    return VideoCard(video: video);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
