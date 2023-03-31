import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcase_app/utils/snackbar.dart';

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
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xffEBEEFD),
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: HighlightView(
              padding: const EdgeInsets.all(10),
              textStyle: TextStyle(
                fontFamily: GoogleFonts.sourceCodePro().fontFamily,
                fontSize: 14,
              ),
              code,
              tabSize: 2,
              language: 'dart',
              theme: atomOneDarkTheme,
              // theme: gaugesTheme,
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MaterialButton(
              splashColor: Colors.white,
              color: Colors.white,
              onPressed: () {
                _copyToClipboard(code);
                showSnackBar("Copied to Clipboard", context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     behavior: SnackBarBehavior.floating,
                //     content: Text(
                //       "Copied to clipboard",
                //     ),
                //   ),
                // );
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.copy,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text("Copy ", style: TextStyle(color: Colors.black))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void _copyToClipboard(String code) {
  Clipboard.setData(ClipboardData(text: code));
}
