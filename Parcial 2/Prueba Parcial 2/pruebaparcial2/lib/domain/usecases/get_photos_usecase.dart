import 'package:pruebaparcial2/data/repositories/photo_repository.dart';
import 'package:pruebaparcial2/domain/entities/photo.dart';

class GetPhotosUsecase {
  final PhotoRepositoryImpl repository;

  GetPhotosUsecase(this.repository);

  Future<List<Photo>> call(int page, int limit) =>
      repository.getPhotos(page, limit);
}