import 'package:flutter/material.dart';

class Params {
  final String title;
  Params({
    required this.title,
  });
}

class RouteParameters extends StatelessWidget {
  final Params params;
  const RouteParameters({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(params.title),
      ),
      body: Center(
        child: Text(params.title),
      ),
    );
  }
}
