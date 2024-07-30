import 'package:flutter/material.dart';
import 'package:wallpaper/wall_paper.dart';

void main() {
  runApp(const WallPaper());
}

class WallPaper extends StatelessWidget {
  const WallPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Pixels(),
    );
  }
}
