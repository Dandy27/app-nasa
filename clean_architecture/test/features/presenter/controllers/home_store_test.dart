import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:clean_architecture/features/presenter/controllers/home_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/date_mock.dart';
import '../../../mock/space_media_entity_mock.dart';

class MockGetSpaceMediaFromDateUseCase extends Mock
    implements GetSpaceMediaFromDateUseCase {}

void main() {
  late HomeStore store;
  late GetSpaceMediaFromDateUseCase mockUsecase;

  setUp(() {
    mockUsecase = MockGetSpaceMediaFromDateUseCase();
    store = HomeStore(mockUsecase);
  });

  test('should return a SpaceMedia from the usecase', () async {
    ///Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => Right(tSpaceMedia));

    ///Act
    await store.getSpaceMediaFromDate(tDate);

    ///Assert
    store.observer(onState: (state) {
      expect(state, tSpaceMedia);
      verify(() => mockUsecase(tDate)).called(1);
    });
  });
  final tFailure = ServerFailure();
  test('should return a Failure from the usecase when there is an error',
      () async {
    ///Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => left(tFailure));

    ///Act
    await store.getSpaceMediaFromDate(tDate);

    ///Assert
    store.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockUsecase(tDate)).called(1);
    });
  });
}
