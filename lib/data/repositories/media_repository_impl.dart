// este repositorio lo implementa el repositorio del dominio

import 'package:robot_de_multimedia/data/datasources/media_local_datasources.dart';
import 'package:robot_de_multimedia/domain/entities/audio_entity.dart';
import 'package:robot_de_multimedia/domain/entities/image_entity.dart';
import 'package:robot_de_multimedia/domain/entities/video_entity.dart';
import '../../domain/repositories/media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaLocalDatasource localDataSource;

  MediaRepositoryImpl({required this.localDataSource});

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

  @override
  Future<Audio> extractAudio(Video video, String format) async {
    return await localDataSource.extractAudio(video, format);
  }
}
