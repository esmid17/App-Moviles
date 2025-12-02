import 'package:flutter/material.dart';
import 'package:pruebaparcial2/domain/entities/photo.dart';
import 'package:pruebaparcial2/themes/index.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.network(
            photo.downloadUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.white24,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.primario,
                    strokeWidth: 3,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, size: 60, color: Colors.grey),
              );
            },
          ),

          // Nombre del autor
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Text(
                photo.author,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}