import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_triple/flutter_triple.dart';

class GetSpaceMediaFromDateUseCase
    implements UseCase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUseCase( this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime? date) async {
    return date != null
        ? await repository.getSpaceMediaFromDate(date)
        : Left(NullParamFailure());
  }
}
