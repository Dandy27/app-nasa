import 'package:clean_architecture/core/http_client/http_client.dart';
import 'package:clean_architecture/features/data/datasource/space_media_datasource_implementation.dart';
import 'package:clean_architecture/features/data/repositories/space_media_repository_impl.dart';
import 'package:clean_architecture/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:clean_architecture/features/presenter/controllers/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'features/presenter/pages/home_page.dart';
import 'features/presenter/pages/picture_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(i())),
    Bind((i) => GetSpaceMediaFromDateUseCase(i())),
    Bind((i) => SpaceMediaRepositoryImpl(i())),
    Bind((i) => NasaDatasourceImplementation(i())),
    Bind((i) => http.Client()),
    // Bind((i) => DateInputConverter()),
    //29,53
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('picture', child: (_, __) => PicturePage()),
  ];
}
