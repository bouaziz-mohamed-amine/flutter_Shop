import 'package:flutter/material.dart';
import 'package:shop_app/stream/widget.dart';

void main() {
  runApp(RunApp());
}
class RunApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}

