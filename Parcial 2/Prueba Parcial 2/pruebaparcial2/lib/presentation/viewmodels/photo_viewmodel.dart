import 'package:flutter/material.dart';
import 'package:pruebaparcial2/domain/entities/photo.dart';
import 'package:pruebaparcial2/domain/usecases/get_photos_usecase.dart';

class PhotoViewmodel extends ChangeNotifier {
  final GetPhotosUsecase _usecase;

  final List<Photo> _all = [];
  List<Photo> _filtered = [];
  bool _loading = false;
  bool _hasMore = true;
  int _page = 1;
  String _query = '';

  List<Photo> get photos => _filtered;
  bool get loading => _loading;
  bool get hasMore => _hasMore;

  PhotoViewmodel(this._usecase) {
    loadMore();
  }

  Future<void> loadMore() async {
    if (_loading || !_hasMore) return;
    _loading = true;
    notifyListeners();

    try {
      final newPhotos = await _usecase(_page, 30);
      if (newPhotos.isEmpty) {
        _hasMore = false;
      } else {
        _all.addAll(newPhotos);
        _applyFilter();
        _page++;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void search(String text) {
    _query = text.toLowerCase();
    _applyFilter();
  }

  void _applyFilter() {
    _filtered = _query.isEmpty
        ? List.from(_all)
        : _all.where((p) => p.author.toLowerCase().contains(_query)).toList();
    notifyListeners();
  }

  Future<void> refresh() async {
    _all.clear();
    _filtered.clear();
    _page = 1;
    _hasMore = true;
    notifyListeners();
    await loadMore();
  }
}