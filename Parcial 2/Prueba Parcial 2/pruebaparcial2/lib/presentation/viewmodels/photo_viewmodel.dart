import 'package:flutter/material.dart';
import 'package:pruebaparcial2/domain/entities/photo.dart';
import 'package:pruebaparcial2/domain/usecases/get_photos_usecase.dart';

class PhotoViewmodel extends ChangeNotifier {
  final GetPhotosUsecase _useCase;

  PhotoViewmodel(this._useCase) {
    loadData(); // carga la primera página al iniciar
  }

  List<Photo> items = [];
  bool loading = false;
  bool hasMore = true;
  int _currentPage = 1;
  String _searchQuery = '';

  List<Photo> get filteredItems => _searchQuery.isEmpty
      ? items
      : items.where((p) => p.author.toLowerCase().contains(_searchQuery)).toList();

  Future<void> loadData() async {
    if (loading) return;
    loading = true;
    hasMore = true;
    _currentPage = 1;
    notifyListeners();

    try {
      items = await _useCase(_currentPage, 30);
      _currentPage++;
    } catch (e) {
      debugPrint('Error: $e');
    }

    loading = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (loading || !hasMore) return;
    loading = true;
    notifyListeners();

    try {
      final newPhotos = await _useCase(_currentPage, 30);
      if (newPhotos.isEmpty) {
        hasMore = false;
      } else {
        items.addAll(newPhotos);
        _currentPage++;
      }
    } catch (e) {
      debugPrint('Error loadMore: $e');
    }

    loading = false;
    notifyListeners();
  }

  void search(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  // Refresh (para el RefreshIndicator)
  Future<void> refresh() async {
    items.clear();
    _currentPage = 1;
    hasMore = true;
    await loadData();
  }
}