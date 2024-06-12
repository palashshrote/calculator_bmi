import 'package:flutter/material.dart';
import 'package:flutter_persistance_drawer/mianwrapper.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Persistance Navigation Drawer with Bloc',
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            // backgroundColor: Color(0xFF0A0E21),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          textTheme: GoogleFonts.ubuntuTextTheme(
            ThemeData.dark().textTheme,
          )),
      home: const MainWrapper(),
    );
  }
}
