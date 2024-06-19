//Aqui van los origenes de datos diferentes o unicos que vayamos a implementar
// Ejemplo: contenido interno del telefono o sqlite, hive.

// La razón por la que ser manejan estas dos clases es para separar las responsabilidades
// y seguir el principio de inversión de dependencias

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:robot_de_multimedia/domain/entities/audio_entity.dart';
import 'package:robot_de_multimedia/domain/entities/image_entity.dart';
import 'package:robot_de_multimedia/domain/entities/video_entity.dart';

abstract class MediaLocalDatasource {
  Future<VideoEntity> convertVideo(VideoEntity video, String formatByUser);
  Future<ImageEntity> convertImage(ImageEntity image, String formatByUser);
  Future<AudioEntity> convertAudio(AudioEntity audio, String formatByUser);
  Future<AudioEntity> extractAudio(VideoEntity video, String formatAudioByUser);
}

//esta clase de implementacion, tiene los metodos explicitos del como se hace
class MediaLocalDatasourceImpl implements MediaLocalDatasource {
  @override
  Future<VideoEntity> convertVideo(VideoEntity video, String formatByUser) {
    // TODO: implement convertVideo
    throw UnimplementedError();
  }

  @override
  Future<AudioEntity> convertAudio(AudioEntity audio, String formatByUser) {
    // TODO: implement convertAudio
    throw UnimplementedError();
  }

  @override
  Future<ImageEntity> convertImage(ImageEntity image, String formatByUser) {
    // TODO: implement convertImage
    throw UnimplementedError();
  }

  @override
  Future<AudioEntity> extractAudio(
      VideoEntity video, String formatAudioByUser) async {
    final rutaAudio =
        video.pathIn.replaceAll(RegExp(r'\.\w+$'), '.$formatAudioByUser');

    // Ejecuta el comando ffmpeg para extraer el audio
    await FFmpegKit.executeAsync(
        '-i ${video.pathIn} -vn -ar 44100 -ac 2 $rutaAudio', (session) async {
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        print('Audio extraído con éxito');
        Fluttertoast.showToast(msg: 'Audio extraído con éxito');
      } else if (ReturnCode.isCancel(returnCode)) {
        print('Proceso cancelado');
        Fluttertoast.showToast(msg: 'Proceso cancelado');
      } else {
        print('Falló al extraer audio');
        Fluttertoast.showToast(msg: 'Falló al extraer audio');
      }
    });

    // Crea un objeto Audio con la información relevante entregada por el video
    final audio = AudioEntity(
      id: video.id,
      title: '${video.title}_audio_',
      duration: video.duration,
      pathIn: video.pathIn, //la ruta originaria seria la ruta del video
      pathOut:
          rutaAudio, // la ruta final o de salida, es la que estimemos para cierta carpeta del telefono
      format: formatAudioByUser,
    );

    // Devuelve el objeto Audio
    return audio;
  }
}
