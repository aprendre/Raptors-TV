import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/category.dart';

class VideoService {
  static final VideoService _instance = VideoService._internal();

  factory VideoService() {
    return _instance;
  }

  VideoService._internal();

  Future<List<Category>> loadVideos() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/videos.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      return jsonData.map((json) => Category.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Erreur lors du chargement des vidéos: $e');
    }
  }
}
