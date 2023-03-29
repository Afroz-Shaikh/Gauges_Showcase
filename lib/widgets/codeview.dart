import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeView extends StatefulWidget {
  final int index;
  final String? codePath;
  const CodeView({super.key, required this.index, required this.codePath});

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  String code = '';

  @override
  void initState() {
    super.initState();
    loadCode();
  }

  Future loadCode() async {
    var extractedCode = await rootBundle.loadString(widget.codePath!);
    setState(() {
      code = extractedCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (code.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      width: double.infinity,
      color: const Color(0xffEBEEFD),
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: HighlightView(
          padding: EdgeInsets.all(10),
          textStyle: TextStyle(
            fontFamily: GoogleFonts.sourceCodePro().fontFamily,
            fontSize: 14,
          ),
          code,
          tabSize: 2,
          language: 'dart',
          // theme: gaugesCodeTheme,
          theme: atomOneDarkTheme,
          // theme: gaugesTheme,
        ),
      ),
    );
  }
}
