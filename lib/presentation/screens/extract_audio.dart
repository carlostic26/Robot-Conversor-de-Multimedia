import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robot_conversor_multimedia/domain/entities/audio.dart';
import 'package:robot_conversor_multimedia/domain/entities/video.dart';
import 'package:robot_conversor_multimedia/domain/usecases/media_use_cases.dart';
import 'package:robot_conversor_multimedia/presentation/providers/riverpod.dart';
import 'package:robot_conversor_multimedia/presentation/widgets/dashed_border_upload_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ExtractAudioScreen extends ConsumerWidget {
  const ExtractAudioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaUseCase = ref.watch(mediaUseCaseProvider);
    late String formatVideoIn;

    final selectedVideo = ref.watch(selectedVideoProvider);
    final selectedFormat = ref.watch(selectedFormatProvider);

    final List<String> audioFormats = [
      'MP3',
      'AAC',
      'WAV',
    ];

//return
/*     FutureBuilder<Audio>(
      future:
          mediaUseCase.extractAudio(video, format), //Entra video y formato dado
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text('Audio extraído con éxito: ${snapshot.data}');
        }
      },
    ); */

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Extraer audio'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),

          const Text(
            'Inserta el video al que deseas extraerle el audio',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),

          // Botón para cargar el video
          GestureDetector(
            onTap: () async {
              final pickedFile =
                  await ImagePicker().pickVideo(source: ImageSource.gallery);

              if (pickedFile != null) {
                final videoController =
                    VideoPlayerController.file(File(pickedFile.path));
                await videoController.initialize();
                final videoDuration = videoController.value.duration;

                final video = Video(
                  id: 'id_${pickedFile.name}',
                  title: pickedFile.name,
                  duration:
                      '${videoDuration.inHours}:${videoDuration.inMinutes % 60}:${videoDuration.inSeconds % 60}',
                  pathIn: pickedFile.path,
                );

                ref.read(selectedVideoProvider.notifier).state = video;
              }
            },
            child: Center(
              child: Container(
                width: screenWidth * 0.8,
                height: 200,
                padding: const EdgeInsets.all(16),
                child: CustomPaint(
                  painter: DashedBorderPainter(
                    color: Colors.white,
                    strokeWidth: 2,
                    gap: 8,
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(97, 238, 238, 238),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: selectedVideo != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://cdn-icons-png.flaticon.com/512/6559/6559073.png',
                                width: screenWidth * 0.8,
                                height: 100,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                selectedVideo.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        : const Icon(
                            Icons.backup,
                            size: 150,
                            color: Color.fromARGB(171, 255, 255, 255),
                          ),
                  ),
                ),
              ),
            ),
          ),

          Divider(),

          selectedVideo != null
              ?
              // Selector de formato de audio
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Elije un tipo de formato de audio',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: audioFormats.length,
                        itemBuilder: (context, index) {
                          final format = audioFormats[index];
                          return RadioListTile<String>(
                            title: Text(format),
                            value: format,
                            groupValue: selectedFormat,
                            onChanged: (value) {
                              ref.read(selectedFormatProvider.notifier).state =
                                  value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                )
              : SizedBox(),

          ElevatedButton(
            onPressed: processExtractAudio(selectedVideo, selectedFormat),
            child: const Text('Procesar'),
          )
        ],
      ),
    );
  }

  processExtractAudio(video, format) {}
}
