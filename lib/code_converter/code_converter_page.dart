import 'dart:convert';

import 'package:flutter/material.dart';

import '../code_solver/text_field_controller.dart';
import 'output_button.dart';

class CodeConverterPage extends StatefulWidget {
  const CodeConverterPage({Key? key}) : super(key: key);

  @override
  State<CodeConverterPage> createState() => _CodeConverterPageState();
}

class _CodeConverterPageState extends State<CodeConverterPage> {
  TextEditingController? codeController,languageController, errorController;

  String? code, actualLanguage, convertLanguage;

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
                "Code Converter",
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
                    controller: errorController,
                    onChanged: (value) {
                      setState(() {
                        convertLanguage = value;
                        print(convertLanguage);
                      });
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.code,
                        color: Colors.grey,
                      ),
                      hintText: "Convert Language",

                      border: InputBorder.none,
                    ),
                  ),
                ),
                OutputButton(code:code==null ? "": code, convertLanguage: convertLanguage==""? "not mentioned" : convertLanguage,)
              ],
            ),
          ),
        ),
      ),
    );
  }

}
