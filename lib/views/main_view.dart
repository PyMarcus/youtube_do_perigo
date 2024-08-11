import 'package:flutter/material.dart';
import 'package:youtube_do_perigo/services/service.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    YouTubeService ys = YouTubeService();
    ys.search();
    return Container(
      child: Text("Inicio"),
    );
  }
}
