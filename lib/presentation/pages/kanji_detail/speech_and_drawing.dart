import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechAndDraw extends StatefulWidget {
  const SpeechAndDraw({super.key, required this.kanji});
  
  final String kanji;

  @override
  State<SpeechAndDraw> createState() => _SpeechAndDrawState();
}

class _SpeechAndDrawState extends State<SpeechAndDraw> {

  FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    initTTS();
  }

  void initTTS() {
    _flutterTts.setLanguage('ja-JP');
    _flutterTts.setSpeechRate(0.5);
    _flutterTts.setVolume(1.0);
    _flutterTts.setPitch(1.2);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Color.fromRGBO(227, 227, 227, 1),
          ),
          onPressed: () async {
            await _flutterTts.speak(widget.kanji);
          },
          icon: Icon(Icons.volume_up_outlined),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Color.fromRGBO(227, 227, 227, 1),
          ),
          onPressed: () {},
          icon: Icon(Icons.draw_outlined),
        ),
      ],
    );
  }
}
