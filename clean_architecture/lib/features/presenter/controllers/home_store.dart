import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:clean_architecture/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Failure, SpaceMediaEntity> {
  final GetSpaceMediaFromDateUseCase usecase;

  HomeStore(this.usecase)
      : super(SpaceMediaEntity(
            copyright: 'copyright',
            date: 'date',
            explanation: 'explanation',
            hdurl: 'hdurl',
            mediaType: 'mediaType',
            serviceVersion: 'serviceVersion',
            title: 'title',
            url: 'url'));

  getSpaceMediaFromDate(DateTime date) async {
    // executeEither(() => usecase(date));

    setLoading(true);
    final result = await usecase(date);
    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);
  }
}
