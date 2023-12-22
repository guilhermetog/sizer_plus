import 'package:flutter/material.dart';
import 'package:sizer_plus/sizer_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer.of(context);
    return Scaffold(
      body: Container(
        height: size.height(100),
        width: size.width(100),
        alignment: Alignment.center,
        child: Box(size: size.fraction(height: 40, width: 90)),
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Sizer size;
  const Box({super.key, required this.size});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height(100),
      width: widget.size.width(100),
      color: Colors.blue,
      alignment: Alignment.center,
      child: Button(size: widget.size.fraction(height: 30, width: 90)),
    );
  }
}

class Button extends StatelessWidget {
  final Sizer size;
  const Button({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height(100),
      width: size.width(100),
      color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "Botão",
        style: TextStyle(fontSize: size.height(50)),
      ),
    );
  }
}
