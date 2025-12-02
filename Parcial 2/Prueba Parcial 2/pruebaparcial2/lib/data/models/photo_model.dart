import 'package:pruebaparcial2/domain/entities/photo.dart';

class PhotoModel extends Photo {
  PhotoModel({
    required super.id,
    required super.author,
    required super.url,
    required super.downloadUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'].toString(),
      author: json['author'],
      url: json['url'],
      downloadUrl: json['download_url'],
    );
  }
}