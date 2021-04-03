import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildExpanded(1, context, Colors.red),
            buildExpanded(2, context, Colors.deepOrange),
            buildExpanded(3, context, Colors.yellowAccent),
            buildExpanded(4, context, Colors.lightGreen),
            buildExpanded(5, context, Colors.green),
            buildExpanded(6, context, Colors.lightBlue),
            buildExpanded(7, context, Colors.teal),
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded(int i, BuildContext context, Color colors) {
    return Expanded(
        child: InkWell(
      onTap: () {
        final audioPlayer = AudioCache();
        audioPlayer.play("note$i.wav",
            mode: PlayerMode.LOW_LATENCY, volume: 10);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: colors,
      ),
    ));
  }
}
