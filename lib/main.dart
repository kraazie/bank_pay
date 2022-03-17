import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank_pay/routes.dart';
import 'package:bank_pay/screens/connect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: ConnectBank(),
      routes: Routes.routes,
    );
  }
}
