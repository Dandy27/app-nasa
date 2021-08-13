import 'dart:convert';

import 'package:clean_architecture/features/data/models/space_media_model.dart';
import 'package:clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mock/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
      copyright: 'Mike Selby',
      date: '2021-08-12',
      explanation:
          "The beautiful Trifid Nebula is a cosmic study in contrasts. Also known as M20, it lies about 5,000 light-years away toward the nebula rich constellation Sagittarius. A star forming region in the plane of our galaxy, the Trifid does illustrate three different types of astronomical nebulae; red emission nebulae dominated by light from hydrogen atoms, blue reflection nebulae produced by dust reflecting starlight, and dark nebulae where dense dust clouds appear in silhouette. But the red emission region roughly separated into three parts by obscuring dust lanes is what lends the Trifid its popular name. Pillars and jets sculpted by newborn stars, below and left of the emission nebula's center, appear in famous Hubble Space Telescope close-up images of the region. The Trifid Nebula is about 40 light-years across. Just too faint to be seen by the unaided eye, it almost covers the area of a full moon in planet Earth's sky. ",
      hdurl:
          "https://apod.nasa.gov/apod/image/2108/M20-SHO-crop-Rev-5-RGB-Ha-OIII-RiDK-700-19-July-2021.jpg",
      mediaType: "image",
      serviceVersion: 'v1',
      title: 'A Beautiful Trifid',
      url:
          "https://apod.nasa.gov/apod/image/2108/M20-SHO-crop-Rev-5-RGB-Ha-OIII-RiDK-700-19-July-2021-1024.jpg");

  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return avalid model', () {
    //Arrange
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    //Act
    final result = SpaceMediaModel.fromJson(jsonMap);
    //Assert
    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    //Arrange
    final expectedMap = {
      "copyright": "Mike Selby",
      "date": "2021-08-12",
      "explanation":
          "The beautiful Trifid Nebula is a cosmic study in contrasts. Also known as M20, it lies about 5,000 light-years away toward the nebula rich constellation Sagittarius. A star forming region in the plane of our galaxy, the Trifid does illustrate three different types of astronomical nebulae; red emission nebulae dominated by light from hydrogen atoms, blue reflection nebulae produced by dust reflecting starlight, and dark nebulae where dense dust clouds appear in silhouette. But the red emission region roughly separated into three parts by obscuring dust lanes is what lends the Trifid its popular name. Pillars and jets sculpted by newborn stars, below and left of the emission nebula's center, appear in famous Hubble Space Telescope close-up images of the region. The Trifid Nebula is about 40 light-years across. Just too faint to be seen by the unaided eye, it almost covers the area of a full moon in planet Earth's sky. ",
      "hdurl":
          "https://apod.nasa.gov/apod/image/2108/M20-SHO-crop-Rev-5-RGB-Ha-OIII-RiDK-700-19-July-2021.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "A Beautiful Trifid",
      "url":
          "https://apod.nasa.gov/apod/image/2108/M20-SHO-crop-Rev-5-RGB-Ha-OIII-RiDK-700-19-July-2021-1024.jpg"
    };
    //Act
    final result = tSpaceMediaModel.toJson();
    //Assert
    expect(result, expectedMap);
  });
}
