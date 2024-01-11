import 'dart:convert';

import 'package:flutter/material.dart';

import '../code_solver/text_field_controller.dart';
import 'hint_button.dart';
import 'solution_button.dart';


class CodeHintProviderPage extends StatefulWidget {
  const CodeHintProviderPage({Key? key}) : super(key: key);

  @override
  State<CodeHintProviderPage> createState() => _CodeHintProviderPageState();
}

class _CodeHintProviderPageState extends State<CodeHintProviderPage> {
  TextEditingController? codeController, problemController, platformController, languageController;

  String? code="";
  String? problem="";
  String? platform="";
  String? language="";

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Image.asset('assets/img.png', width: size.width * 0.2, fit: BoxFit.cover,),
              ),
              Text(
                "DSA solver",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFE9EFC0),
      ),
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/login_bg.gif'
                )
            )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                TextFieldController(
                  child: TextField(
                    controller: codeController,
                    onChanged: (value) {
                      setState(() {
                        code = value;
                        print(code);
                      });
                    },
                    maxLines: 15,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.laptop_mac_outlined,
                        color: Colors.grey,
                      ),
                      hintText: "Paste your code here",

                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldController(
                  child: TextField(
                    controller: problemController,
                    onChanged: (value) {
                      setState(() {
                        problem = value;
                        print(problem);
                      });
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.question_mark,
                        color: Colors.grey,
                      ),
                      hintText: "Problem Statement",

                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldController(
                  child: TextField(
                    controller: platformController,
                    onChanged: (value) {
                      setState(() {
                        platform = value;
                        print(platform);
                      });
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.code,
                        color: Colors.grey,
                      ),
                      hintText: "Platform",

                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldController(
                  child: TextField(
                    controller:languageController,
                    onChanged: (value) {
                      setState(() {
                        language = value;
                        print(language);
                      });
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.code,
                        color: Colors.grey,
                      ),
                      hintText: "Language",

                      border: InputBorder.none,
                    ),
                  ),
                ),

               Center(

                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,

                   children: [
                     SolutionButton(code:code, platform: platform, problem: problem,language: language),
                     HintButton(code:code, platform: platform, problem: problem,language: language),

                   ],
                 ),
               )

              ],
            ),
          ),
        ),
      ),
    );
  }

}
