import 'dart:convert';

import 'package:flutter/material.dart';
import 'solver_button.dart';
import 'text_field_controller.dart';

class CodeSolverPage extends StatefulWidget {
  const CodeSolverPage({Key? key}) : super(key: key);

  @override
  State<CodeSolverPage> createState() => _CodeSolverPageState();
}

class _CodeSolverPageState extends State<CodeSolverPage> {
  TextEditingController? codeController,languageController, errorController;

  String? code, language, error;

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
                "Code Solver",
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
      body: SingleChildScrollView(
        child: Container(
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
                    controller: languageController,
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
                TextFieldController(
                  child: TextField(
                    controller: errorController,
                    onChanged: (value) {
                      setState(() {
                        error = value;
                        print(error);
                      });
                    },
                    maxLines: 5,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.error,
                        color: Colors.grey,
                      ),
                      hintText: "Type your error facing here",

                      border: InputBorder.none,
                    ),
                  ),
                ),
                RoundedButton(code:code==null ? "": code, language: language==null? "": language,error: error==""? "not mentioned" : error,)
              ],
            ),
          ),
        ),
      ),
    );
  }

}
