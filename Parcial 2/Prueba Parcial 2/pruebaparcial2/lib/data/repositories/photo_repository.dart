import 'package:pruebaparcial2/data/datasources/photo_datasource.dart';
import 'package:pruebaparcial2/domain/entities/photo.dart';

class PhotoRepositoryImpl {
  final PhotoDatasource _datasource;

  PhotoRepositoryImpl(this._datasource);

  Future<List<Photo>> getPhotos(int page, int limit) async {
    final models = await _datasource.getPhotos(page, limit);
    return models;
  }
}