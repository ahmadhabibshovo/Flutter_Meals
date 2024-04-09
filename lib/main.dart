import 'dart:io' show Platform;

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal/screen/tab_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    DevicePreview(
      enabled: (Platform.isAndroid || Platform.isIOS) ? true : false,
      builder: (context) => const ProviderScope(child: App()), // Wrap your app
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const TabScreen()
        // TabScreen(),
        );
  }
}
