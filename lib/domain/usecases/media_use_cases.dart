import 'package:robot_conversor_multimedia/domain/entities/audio.dart';
import 'package:robot_conversor_multimedia/domain/entities/image.dart';
import 'package:robot_conversor_multimedia/domain/entities/video.dart';
import 'package:robot_conversor_multimedia/domain/repositories/media_repository.dart';

class MediaUseCase {
  final MediaRepository repositorio;

  MediaUseCase({required this.repositorio});

  Future<Audio> extractAudio(Video video, String format) async {
    return await repositorio.extractAudio(video, format);
  }

  Future<Video> convertVideo(Video video, String format) async {
    return await repositorio.convertVideo(video, format);
  }

  Future<Video> convertImage(Image image, String format) async {
    return await repositorio.convertImage(image, format);
  }

  Future<Video> convertAudio(Audio audio, String format) async {
    return await repositorio.convertAudio(audio, format);
  }
}
