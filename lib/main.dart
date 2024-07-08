import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robot_conversor_multimedia/presentation/common/loading_screen.dart';
import 'package:robot_conversor_multimedia/config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
    child: MaterialApp(
      title: 'Robot conversor',
      theme: myAppThemeData,
      debugShowCheckedModeBanner: false,
      home: const LoadingScreen(),
    ),
  ));
}
