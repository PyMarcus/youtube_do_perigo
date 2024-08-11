import 'package:flutter/material.dart';

class BoomingView extends StatefulWidget {
  const BoomingView({super.key});

  @override
  State<BoomingView> createState() => _BoomingViewState();
}

class _BoomingViewState extends State<BoomingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Em alta"),
    );
  }
}
