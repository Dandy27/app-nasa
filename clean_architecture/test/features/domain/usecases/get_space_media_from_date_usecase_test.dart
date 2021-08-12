import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture/features/domain/repositories/space_media_repository.dart';
import 'package:clean_architecture/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUseCase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUseCase(repository: repository);
  });
  final tSpaceMedia = SpaceMediaEntity(
      copyright: 'copyright',
      date: 'date',
      explanation: 'explanation',
      hdurl: 'hdurl',
      mediaType: 'mediaType',
      serviceVersion: 'serviceVersion',
      title: 'title',
      url: 'url');

  final tDate = DateTime(2021, 03, 27);
  test('should get space media for given date from the repository', () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Right(tSpaceMedia));
    // Act
    final result = await usecase(tDate);
//Assert
    expect(result, Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });

  test('should return a Failure when dont\'t succeed', () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    final result = await usecase(tDate);
//Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });
}
