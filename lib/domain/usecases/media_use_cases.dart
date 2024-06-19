import 'package:robot_de_multimedia/domain/repositories/media_repository.dart';
import 'package:robot_de_multimedia/presentation/screens_barril.dart';

class MediaUseCase {
  final MediaRepository repositorio;

  MediaUseCase({required this.repositorio});

  Future<VideoEntity> convertVideo(VideoEntity video, String format) async {
    return await repositorio.convertVideo(video, format);
  }

  Future<ImageEntity> convertImage(ImageEntity image, String format) async {
    return await repositorio.convertImage(image, format);
  }

  Future<AudioEntity> convertAudio(AudioEntity audio, String format) async {
    return await repositorio.convertAudio(audio, format);
  }

  Future<AudioEntity> extractAudio(VideoEntity video, String format) async {
    return await repositorio.extractAudio(video, format);
  }
}
