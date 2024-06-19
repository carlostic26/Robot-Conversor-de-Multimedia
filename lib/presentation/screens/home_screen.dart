import 'package:flutter/material.dart';
import 'package:robot_de_multimedia/presentation/widgets/option_icon_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Robot conversor'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 80, 15, 5),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              OptionIcon(
                icon: Icons.video_library,
                label: 'Convertir Video',
                onTapCallback: () =>
                    _goToVideoScreen(context), // Navega a la pantalla de video
              ),
              OptionIcon(
                icon: Icons.image,
                label: 'Convertir Imagen',
                onTapCallback: () =>
                    _goToImageScreen(context), // Navega a la pantalla de imagen
              ),
              OptionIcon(
                icon: Icons.audiotrack,
                label: 'Convertir Audio',
                onTapCallback: () {},
              ),
              OptionIcon(
                icon: Icons.headset,
                label: 'Extraer Audio',
                onTapCallback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToVideoScreen(BuildContext context) {
    // Lógica para navegar a la pantalla de video
    // Puedes usar Navigator.push() para cambiar a la nueva pantalla.
  }

  void _goToImageScreen(BuildContext context) {
    // Lógica para navegar a la pantalla de imagen
  }
}
