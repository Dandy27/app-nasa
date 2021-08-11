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
  test('should get space media entity for a given from the repository',
      () async {
    when((repository.getSpaceMediaFromDate(tDate)) as dynamic)
        .thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    final result = await usecase(tDate);
    expect(result, Right(tSpaceMedia));
    verify((repository.getSpaceMediaFromDate(tDate)) as dynamic);
  });
}
