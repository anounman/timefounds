import 'package:flutter/material.dart';

class PostboxScreen extends StatelessWidget {
  const PostboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Postbox')),
      body: const Center(child: Text('Postbox Screen')),
    );
  }
}
