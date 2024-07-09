import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crypto_portfolio/homescreen.dart';
import 'package:getx_crypto_portfolio/utils.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await registerServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      routes: {
        '/home': (context) => Homescreen(),
      },
      initialRoute: '/home',
    );
  }
}
