import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/data/datasource/space_media_datasource.dart';
import 'package:clean_architecture/features/data/models/space_media_model.dart';
import 'package:clean_architecture/features/data/repositories/space_media_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaDataSource extends Mock implements ISpaceMediaDataSource {}

void main() {
  late SpaceMediaRepositoryImpl repository;
  late ISpaceMediaDataSource dataSource;

  setUp(() {
    dataSource = MockSpaceMediaDataSource();
    repository = SpaceMediaRepositoryImpl( dataSource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
      copyright: 'copyright',
      date: 'date',
      explanation: 'explanation',
      hdurl: 'hdurl',
      mediaType: 'mediaType',
      serviceVersion: 'serviceVersion',
      title: 'title',
      url: 'url');
  final tDate = DateTime(2021, 03, 27);

  test('should return media model when call the datasource', () async {
    //Arrange
    when(() => dataSource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);
    //Act
    final result = await repository.getSpaceMediaFromDate(tDate);
    //Asset
    expect(result, Right(tSpaceMediaModel));
    verify(() => dataSource.getSpaceMediaFromDate(tDate)).called(1);
  });

  test(
      'should return a server failure  when calls the call to datasource is unsuccessful',
      () async {
    //Arrange
    when(() => dataSource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerException());
    //Act
    final result = await repository.getSpaceMediaFromDate(tDate);
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => dataSource.getSpaceMediaFromDate(tDate)).called(1);
  });
}
