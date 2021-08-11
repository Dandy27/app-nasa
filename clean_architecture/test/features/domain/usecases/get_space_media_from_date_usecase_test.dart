import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
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
    usecase = GetSpaceMediaFromDateUseCase(repository);
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

  final tNoparams = NoParams();
  test('should get space media entity for a given from the repository',
      () async {
    when(repository.getSpaceMediaFromDate)
        .thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    final result = await usecase(tNoparams);
    expect(result, Right(tSpaceMedia));
    verify(repository.getSpaceMediaFromDate);
  });
}
