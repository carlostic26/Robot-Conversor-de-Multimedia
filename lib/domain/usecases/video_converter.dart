import 'package:robot_de_multimedia/data/repositories/video_repository_impl.dart';

class VideoConverter {
  final VideoRepository repositorio;

  VideoConverter({required this.repositorio});

  Future<String> call(String rutaVideo) {
    return repositorio.extraerAudio(rutaVideo);
  }
}
