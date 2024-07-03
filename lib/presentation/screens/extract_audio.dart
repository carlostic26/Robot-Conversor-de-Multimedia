import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robot_conversor_multimedia/domain/entities/audio.dart';
import 'package:robot_conversor_multimedia/domain/usecases/media_use_cases.dart';
import 'package:robot_conversor_multimedia/presentation/providers/riverpod.dart';
import 'package:robot_conversor_multimedia/presentation/widgets/dashed_border_upload_button.dart';

class ExtractAudioScreen extends ConsumerWidget {
  const ExtractAudioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaUseCase = ref.watch(mediaUseCaseProvider);

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
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Extraer audio'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // Otros widgets relacionados con la extracción de audio

          // Botón para cargar el video
          GestureDetector(
            onTap: () {
              // Lógica para cargar el video
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
                    child: const Icon(
                      Icons.backup,
                      size: 150,
                      color: Color.fromARGB(171, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Text(
            'Inserta el video al que deseas extraerle el audio',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
