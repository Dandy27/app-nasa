import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';

class GetSpaceMediaFromDateUseCase
    implements UseCase<SpaceMediaEntity, NoParams> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUseCase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(NoParams params) async {
    return await repository.getSpaceMediaFromDate();
  }
}
