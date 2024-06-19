// El repositorio de dominio accede al repositorio de los datos
// y no sabe cómo se almacenan o recuperan los datos.
// solo declara los metodos y listo (alto nivel)

// es una interfaz que define los métodos para interactuar con los datos Media.

import 'package:robot_de_multimedia/domain/entities/audio_entity.dart';
import 'package:robot_de_multimedia/domain/entities/image_entity.dart';
import 'package:robot_de_multimedia/domain/entities/video_entity.dart';

abstract class MediaRepository {
  Future<VideoEntity> convertVideo(VideoEntity video, String format);
  Future<AudioEntity> convertAudio(AudioEntity audio, String format);
  Future<ImageEntity> convertImage(ImageEntity image, String format);
  Future<AudioEntity> extractAudio(VideoEntity video, String format);
}
