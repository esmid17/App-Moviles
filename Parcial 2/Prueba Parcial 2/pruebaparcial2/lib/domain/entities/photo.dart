// lib/domain/entities/photo.dart
class Photo {
  final String id;
  final String author;
  final String url;
  final String downloadUrl;

  Photo({
    required this.id,
    required this.author,
    required this.url,
    required this.downloadUrl,
  });
}

