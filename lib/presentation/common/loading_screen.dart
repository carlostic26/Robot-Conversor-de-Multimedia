import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:robot_conversor_multimedia/presentation/providers/riverpod.dart';
import 'package:robot_conversor_multimedia/presentation/screens/home_screen.dart';
import 'package:robot_conversor_multimedia/config/theme/app_theme.dart';
export 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*Inicialización de variables y estados */

    Future.delayed(const Duration(seconds: 1), () {
      // Habilita el boton solamente en el provider
      ref.read(buttonContinue.notifier).enableButton();
    });

    final buttonEnabled = ref.watch(
        buttonContinue); //crea variable que solo observa el estado del boton

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double screenDiagonal = sqrt(height * height + width * width);
    bool isTablet = screenDiagonal > 900.0;

    // Determina la orientación de la pantalla
    bool isLandscape = width > height;
    print('is Landscape? $isLandscape');
    print('horizontal $width');
    print('vertical $height');

    double imageHeight;
    double textSize;

    if (isLandscape) {
      print('horizontal');
      imageHeight = height * 0.20;
      textSize = 10;
    } else {
      print('vertical');
      imageHeight = height * 0.15;
      textSize = 9;
    }

    return Scaffold(
      backgroundColor: myAppThemeData.primaryColor,
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.12,
              ),
              Container(
                height: imageHeight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child:
                    //Image.asset("assets/logo.png"),

                    Image.network(
                  'https://cdn-icons-png.flaticon.com/512/6559/6559073.png',
                  width: 300,
                  height: 100,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                        width: width * 0.55,
                        lineHeight: 5,
                        percent: 100 / 100,
                        animation: true,
                        animationDuration: 10000,
                        progressColor: Colors.blueGrey),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " cursos gratuitos de 22 categorias...",
                    style: TextStyle(
                      fontSize: textSize,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: TextButton(
                    onPressed: buttonEnabled
                        ? () async {
                            //El siguiente metodo es para el caso que sea primer acceso y se deba mostrar tutorial
                            //isLoaded(context);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomeScreen()));
                          }
                        : null,
                    style: ButtonStyle(
                      backgroundColor: buttonEnabled
                          ? WidgetStateProperty.all<Color>(
                              Colors.blueGrey,
                            )
                          : WidgetStateProperty.all<Color>(Colors.grey),
                    ),
                    child: Text(
                      'Continuar',
                      style: TextStyle(
                          fontSize: 10,
                          color:
                              buttonEnabled ? Colors.white : Colors.blueGrey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

//El siguiente codigo es para el caso que sea primer acceso y se deba mostrar tutorial

/* isLoaded(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? primerAcceso = prefs.getBool('primerAcceso');

    //print('primer acceso bool:$primerAcceso');

     if (primerAcceso == true || primerAcceso == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      if (primerAcceso == false) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    }  */
}
