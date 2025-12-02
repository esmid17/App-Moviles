import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/photo_datasource.dart';
import 'data/repositories/photo_repository.dart';
import 'domain/usecases/get_photos_usecase.dart';
import 'presentation/viewmodels/photo_viewmodel.dart';
import 'presentation/view/home_page.dart';
import 'themes/general_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = http.Client();

    return ChangeNotifierProvider(
      create: (_) => PhotoViewmodel(
        GetPhotosUsecase(
          PhotoRepositoryImpl(PhotoDatasourceImpl(client)),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba Parcial 2',
        theme: TemaGeneral.claro,
        home: const HomePage(),
      ),
    );
  }
}