import 'dart:convert';

import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/http_client/http_client.dart';
import 'package:clean_architecture/core/utils/convertes/date_to_string_converters.dart';
import 'package:clean_architecture/core/utils/keys/nasa_api_keys.dart';
// import 'package:clean_architecture/core/utils/keys/nasa_api_keys.dart';
import 'package:clean_architecture/features/data/datasource/endpoints/nasa_endpoints.dart';
import 'package:clean_architecture/features/data/datasource/space_media_datasource.dart';
import 'package:clean_architecture/features/data/models/space_media_model.dart';

class NasaDatasourceImplementation implements ISpaceMediaDataSource {
  final HttpClient client;

  NasaDatasourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client.get(NasaEndpoints.apod(
        Nasaapikeys.apikey, DateToStringConverters.convert(date)));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
