import 'package:flutter/material.dart';
import 'package:funny_kakaokeyboard/Screen/kakaoKeyboard.dat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : _main(),
    );
  }
}

class _main extends StatelessWidget {
  const _main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //     elevation: 0,
      //
      //     title: Text('카카오 키패드',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),backgroundColor: Color(0xffffe404) ),
      body: kakaoKeyboard(),
    );
  }
}
