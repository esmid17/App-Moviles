import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/photo_model.dart';

abstract class PhotoDatasource {
  Future<List<PhotoModel>> getPhotos(int page, int limit);
}

class PhotoDatasourceImpl implements PhotoDatasource {
  final http.Client client;

  PhotoDatasourceImpl(this.client);

  @override
  Future<List<PhotoModel>> getPhotos(int page, int limit) async {
    final url = Uri.https('picsum.photos', '/v2/list', {
      'page': page.toString(),
      'limit': limit.toString(),
    });

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar fotos');
    }
  }
}