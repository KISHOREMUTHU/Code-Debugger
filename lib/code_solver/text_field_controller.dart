import 'package:flutter/material.dart';

class TextFieldController extends StatelessWidget {
  final Widget child;

  const TextFieldController({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
         boxShadow: [
           BoxShadow(
             color: Colors.black.withAlpha(100),
             spreadRadius: 1,
             blurRadius: 10,
           )
         ]
        ),
        child: child,
      ),
    );
  }
}