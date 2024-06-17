import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robot_de_multimedia/domain/entities/audio.dart';
import 'package:robot_de_multimedia/domain/usecases/media_use_cases.dart';
import 'package:robot_de_multimedia/presentation/providers/riverpod.dart';

class ExtractAudio extends ConsumerWidget {
  const ExtractAudio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaUseCase = ref.watch(mediaUseCaseProvider);
    //mediaUseCase.extractAudio();

    FutureBuilder<Audio>(
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
    );

    return const Scaffold();
  }
}
