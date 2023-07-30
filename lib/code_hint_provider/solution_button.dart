import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../code_editor_page.dart';



class SolutionButton extends StatefulWidget {
  final String? code,problem, platform, language;

  const SolutionButton({Key? key, this.code, this.platform, this.problem, this.language})
      : super(key: key);

  @override
  State<SolutionButton> createState() => _SolutionButtonState();
}

class _SolutionButtonState extends State<SolutionButton> {
  String? outputString ="";
  String? textString ="Get solution";
  String? langString = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
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
              if(widget.code == ""){
                const snackBar = SnackBar(
                  content: Text('Enter required data to proceed ... '),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              else {
               setState(() {
                 textString = "Fetching solution ...";
               });

                print("Code : " + widget.code!);
                outputString = await generateResponse("Share me the answer to the problem " + widget.problem! + " of "+ widget.platform! + " platform in " + widget.language!+ " language" );
                print("Output code: " + outputString!);
               setState(() {
                 textString = "Get solution";
               });
               if(widget.language == "C"){
                 setState(() {
                   langString= "c";
                 });
               }
               else if(widget.language == "C++"){
                 setState(() {
                   langString= "cpp";
                 });
               }
               else if(widget.language == "Javascript" || widget.language == "javascript"||  widget.language == "Js" || widget.language == "js"   ){
                 setState(() {
                   langString= "js";
                 });
               }
               else if(widget.language == "Python" || widget.language == "python" ){
                 setState(() {
                   langString= "py";
                 });
               }

               Navigator.push(context,MaterialPageRoute(builder: (context) => CodeEditorPage(codeString: outputString,langString: langString,)));

              }

            },
            child: Center(
              child: Text(
                textString!,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ),
        ),
      ),
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