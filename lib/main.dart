import 'package:flutter/material.dart';
import 'package:flutter_m10/pertemuan11/pertemuan11_provider.dart';
import 'package:flutter_m10/pertemuan11/pertemuan11_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider( providers: [
    ChangeNotifierProvider<Pertemuan11Provider>(create: (context) => Pertemuan11Provider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Pertemuan11Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
