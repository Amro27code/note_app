import 'package:flutter/material.dart';

class NoFoundScreen extends StatelessWidget {
  const NoFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data"), backgroundColor: Colors.red),
      body: Center(child: Text("No Found This Screen")),
    );
  }
}
