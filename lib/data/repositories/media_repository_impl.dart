// este repositorio (MediaRepository) es definido (alto nivel) en el repositorio de dominio
// Por loo tanto implementa de el

import 'package:robot_conversor_multimedia/data/datasources/media_local_datasources.dart';
import 'package:robot_conversor_multimedia/domain/entities/audio.dart';
import 'package:robot_conversor_multimedia/domain/entities/image.dart';
import 'package:robot_conversor_multimedia/domain/entities/video.dart';
import '../../domain/repositories/media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaLocalDatasource localDataSource;

  MediaRepositoryImpl({required this.localDataSource});

  @override
  Future<Audio> extractAudio(Video video, String format) async {
    return await localDataSource.extractAudio(video, format);
  }

  @override
  Future<Video> convertAudio(Audio audio, String format) async {
    return await localDataSource.convertAudio(audio, format);
  }

  @override
  Future<Video> convertImage(Image image, String format) async {
    return await localDataSource.convertImage(image, format);
  }

  @override
  Future<Video> convertVideo(Video video, String format) async {
    return await localDataSource.convertVideo(video, format);
  }
}
