import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robot_de_multimedia/presentation/common/loading_screen.dart';
import 'package:robot_de_multimedia/presentation/theme/app_theme.dart';
import 'dart:async';

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
