// El repositorio de datasource (media_repository_impl) implementa esta clase
// Desde aqui (repositorio de dominio) se accede al repositorio de los datos por la impl de datasource
// y no sabe cómo se almacenan o recuperan los datos.
// solo declara los metodos y listo (alto nivel)

// es una interfaz que define los métodos para interactuar con los datos Media.

import 'package:robot_conversor_multimedia/domain/entities/audio.dart';
import 'package:robot_conversor_multimedia/domain/entities/image.dart';
import 'package:robot_conversor_multimedia/domain/entities/video.dart';

abstract class MediaRepository {
  Future<Audio> extractAudio(Video video, String format);
  Future<Video> convertVideo(Video video, String format);
  Future<Video> convertAudio(Audio audio, String format);
  Future<Video> convertImage(Image image, String format);
}
