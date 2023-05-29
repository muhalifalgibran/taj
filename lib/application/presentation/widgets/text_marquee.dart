import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextMarquee extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration? delayed;
  final bool isRepeat;

  const TextMarquee({
    required this.text,
    this.textStyle,
    this.delayed,
    this.isRepeat = false,
    super.key,
  });

  @override
  State<TextMarquee> createState() => _TextMarqueeState();
}

class _TextMarqueeState extends State<TextMarquee> {
  final StringBuffer _textBuilder = StringBuffer();

  marqueeingText() async {
    setState(() {
      _textBuilder.clear();
    });
    var listText = widget.text.split('');
    for (var t = 0; t < listText.length; t++) {
      await Future.delayed(widget.delayed ?? const Duration(milliseconds: 750));
      setState(() {
        _textBuilder.write(listText[t]);
      });
    }
    await Future.delayed(widget.delayed ?? const Duration(milliseconds: 750));

    if (widget.isRepeat) marqueeingText();
  }

  @override
  void initState() {
    super.initState();
    marqueeingText();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _textBuilder.toString(),
      style: widget.textStyle ?? GoogleFonts.openSans(),
    );
  }
}
