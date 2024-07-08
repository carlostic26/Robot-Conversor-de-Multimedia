import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:robot_conversor_multimedia/presentation/screens/convert_screen.dart';
import 'package:robot_conversor_multimedia/presentation/screens/extract_audio.dart';
import 'package:robot_conversor_multimedia/presentation/screens/info_screen.dart';

import '../widgets/custom_button_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Menú Principal'),
        actions: [
/*           IconButton(
            onPressed: infoApp(context),
            icon: const Icon(Icons.info),
          ) */
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2, // Número de columnas en el grid
        children: [
          CustomButton(
            imagePath: 'assets/button1.png',
            onPressed: () {
              goExtractAudioScreen(context);
            },
            buttonText: 'Extraer audio',
          ),
          CustomButton(
            imagePath: 'assets/button1.png',
            onPressed: () {
              goconverScreen(context);
            },
            buttonText: 'Convertir video',
          ),
          CustomButton(
            imagePath: 'assets/button1.png',
            onPressed: () {
              goconverScreen(context);
            },
            buttonText: 'Convertir audio',
          ),
          CustomButton(
            imagePath: 'assets/button1.png',
            onPressed: () {
              goconverScreen(context);
            },
            buttonText: 'Convertir imagen',
          ),
        ],
      ),
    );
  }

  infoApp(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const InfoApp()));
  }

  void goExtractAudioScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ExtractAudioScreen()));
  }

  void goconverScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ConvertScreen()));
  }
}
