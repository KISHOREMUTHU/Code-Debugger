import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';

class CodeEditorPage extends StatefulWidget {
  final String? codeString, langString;
  const CodeEditorPage({Key? key, this.codeString, this.langString}) : super(key: key);

  @override
  State<CodeEditorPage> createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends State<CodeEditorPage> {


  @override
  Widget build(BuildContext context) {
    List<FileEditor> files = [
      FileEditor(
        name: "output."+ widget.langString!,
        language: "java",
        code: widget.codeString, // [code] needs a string
      ),
    ];
    EditorModel model = EditorModel(
      files: files, // the files created above
      // you can customize the editor as you want

      styleOptions: EditorModelStyleOptions(
        fontSize: 13,
        heightOfContainer: 400
      ),
    );
    final myController = TextEditingController(text: 'hello!');

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFFE9EFC0) ,
        title : Text(
          "Solved Code",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: SingleChildScrollView(
        // /!\ important because of the telephone keypad which causes a "RenderFlex overflowed by x pixels on the bottom" error
        // display the CodeEditor widget
        child: Container(
          child: CodeEditor(


            model: model, // the model created above, not required since 1.0.0
            edit: true, // can edit the files? by default true
            onSubmit: (String? language, String? value) => print("yo"),
            disableNavigationbar:
            false, // hide the navigation bar ? by default false
            textEditingController:
            myController, // Provide an optional, custom TextEditingController.
          ),
        ),
      ),
    );
  }
}
