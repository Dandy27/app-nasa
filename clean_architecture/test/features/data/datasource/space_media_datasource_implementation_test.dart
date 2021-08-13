import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/utils/convertes/date_to_string_converters.dart';
import 'package:clean_architecture/features/data/models/space_media_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:clean_architecture/core/http_client/http_client.dart';
import 'package:clean_architecture/features/data/datasource/space_media_datasource.dart';
import 'package:clean_architecture/features/data/datasource/space_media_datasource_implementation.dart';

import '../../../mock/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDataSource dataSource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    dataSource = NasaDatasourceImplementation(client);
  });
  final tDateTime = DateTime(2021, 03, 27);
  final urlExpected =
      "https://api.nasa.gov/planetary/apod?api_key=KkinhzmOWPsip8BkoOFmbNrIhwL3KhoZDDQLFm66&date=2021-03-27";
  DateToStringConverters.convert(tDateTime);

  void successMock() {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
  }

  test('should call the get method with correct url', () async {
//Arrange
    successMock();
//Act
    await dataSource.getSpaceMediaFromDate(tDateTime);
//Assert
    verify(() => client.get(urlExpected)).called(1);
  });

  test('should return a SpaceMediaModel when is successful ', () async {
    ///Arrange
    successMock();
    final tSpaceMediaModelExpected = SpaceMediaModel(
        copyright: 'Mike Selby',
        date: '2021-08-12',
        explanation: 
            "The beautiful Trifid Nebula is a cosmic study in contrasts. Also known as M20, it lies about 5,000 light-years away toward the nebula rich constellation Sagittarius. A star forming region in the plane of our galaxy, the Trifid does illustrate three different types of astronomical nebulae; red emission nebulae dominated by light from hydrogen atoms, blue reflection nebulae produced by dust reflecting starlight, and dark nebulae where dense dust clouds appear in silhouette. But the red emission region roughly separated into three parts by obscuring dust lanes is what lends the Trifid its popular name. Pillars and jets sculpted by newborn stars, below and left of the emission nebula's center, appear in famous Hubble Space Telescope close-up images of the region. The Trifid Nebula is about 40 light-years across. Just too faint to be seen by the unaided eye, it almost covers the area of a full moon in planet Earth's sky. ",
        hdurl:
            "https://apod.nasa.gov/apod/image/2108/M20-SHO-crop-Rev-5-RGB-Ha-OIII-RiDK-700-19-July-2021.jpg",
        mediaType: 'image',
        serviceVersion: 'v1',
        title: "A Beautiful Trifid",
        url:
            "https://apod.nasa.gov/apod/image/2108/M20-SHO-crop-Rev-5-RGB-Ha-OIII-RiDK-700-19-July-2021-1024.jpg");

    ///Act
    final result = await dataSource.getSpaceMediaFromDate(tDateTime);

    ///Assert
    expect(result, tSpaceMediaModelExpected);
  });

  test('should throw a ServerExeption when the call is unccessful', () {
    ///Arrange
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: 'somenthing went wrong', statusCode: 400));

    ///Act
    final result = dataSource.getSpaceMediaFromDate(tDateTime);

    ///Assert
    expect(() => result, throwsA(ServerException()));
  });
}
