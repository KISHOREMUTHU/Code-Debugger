import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../code_editor_page.dart';



class HintButton extends StatefulWidget {
  final String? code,problem, platform, language;

  const HintButton({Key? key, this.code, this.platform, this.problem, this.language})
      : super(key: key);

  @override
  State<HintButton> createState() => _HintButtonState();
}

class _HintButtonState extends State<HintButton> {
  String? outputString ="";
  String? textString = "Get Hint";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.44,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          color: Colors.green.shade400,
          onPressed: () async {
            if(widget.code == "" || widget.language=="" || widget.problem=="" || widget.platform==""){
              const snackBar = SnackBar(
                content: Text('Enter required data to proceed ... '),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            else {
              setState(() {
                textString= "Fetching hint ...";
              });

              print("Code : " + widget.code!);
              outputString = await generateResponse("Tell me some hints for the problem " + widget.problem! + " of "+ widget.platform! + " platform in " + widget.language!+ " language" );
              print("Output code: " + outputString!);
              setState(() {
                textString= "Get hint";
              });
              showAlertDialog(context, outputString);
            }

          },
          child: Text(
            textString!,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context, String? text) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hints "),
      content: Text(text!),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Future<String> generateResponse(String prompt) async {
    const apiKey = "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";

    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $apiKey"
      },
      body: json.encode({
        "model": "text-davinci-003",
        "prompt": prompt,
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );

    // Do something with the response
    Map<String, dynamic> newresponse = jsonDecode(response.body);
    print(newresponse['choices'][0]['text']);
    return newresponse['choices'][0]['text'];
  }
}