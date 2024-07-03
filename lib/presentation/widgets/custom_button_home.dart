import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String imagePath;
  final String buttonText; // Nuevo argumento para el texto
  final VoidCallback onPressed;

  const CustomButton({
    required this.imagePath,
    required this.buttonText, // Asegúrate de agregar este argumento
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Image.asset(imagePath),
            SizedBox(height: 8), // Espacio entre la imagen y el texto
            Text(buttonText), // Muestra el texto debajo de la imagen
          ],
        ),
      ),
    );
  }
}
