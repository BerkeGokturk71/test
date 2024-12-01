import 'package:flutter/material.dart';

class CamasirScreen extends StatefulWidget {
  const CamasirScreen({super.key});

  @override
  State<CamasirScreen> createState() => _CamasirScreenState();
}

class _CamasirScreenState extends State<CamasirScreen> {
  final TextEditingController username = TextEditingController();
  final TextEditingController room = TextEditingController();
  static final int _textlenght = 25;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: username,
            maxLength: _textlenght,
            decoration: InputDecoration(
                hintText: "username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(style: BorderStyle.solid))),
          ),
          TextField(
            controller: room,
            maxLength: _textlenght,
            decoration: InputDecoration(
                hintText: "username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(style: BorderStyle.solid))),
          ),
        ],
      ),
    );
  }
}
