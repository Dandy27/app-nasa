import 'package:clean_architecture/features/domain/repositories/space_media_repository.dart';
import 'package:clean_architecture/features/domain/usecases/get_space_media_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  GetSpaceMediaUseCase usecase;
  ISpaceMediaRepository repository;
  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaUseCase(repository);
  });

  test('should get space media from for a given from the repository', () {});
}
