import 'package:flutter/material.dart';
import './pages/home.dart';

void main() => runApp(BitcoinTracker());

class BitcoinTracker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black54
      ),
      home: Home(),
    );
  }
}