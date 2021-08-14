import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/features/data/datasource/space_media_datasource.dart';
import 'package:clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';

class SpaceMediaRepositoryImpl implements ISpaceMediaRepository {
  final ISpaceMediaDataSource datasource;

  SpaceMediaRepositoryImpl( this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date) async{
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }



}
