import 'package:robot_de_multimedia/presentation/screens_barril.dart';

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

    return const Scaffold();
  }
}
