import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  //valuesetter는 기본적으로 callback 함수
  final ValueSetter<dynamic> onTap;


  const KeyboardKey({
    required this.label,
    required this.onTap,
    required this.value,
    Key? key}) : super(key: key);

  @override
  State<KeyboardKey> createState() => _KeyboardKeyState();
}


class _KeyboardKeyState extends State<KeyboardKey> {

  //배열에 String과 Icon 위젯이 섞여있음
  renderLabel(){
    //만약 Widget이라면 => Icon을 반환하는것임
    if(widget.label is Widget){
      print('아이콘 ${widget.label.runtimeType}');
      return widget.label;
    }
    // Text 안에는 스트링만 들어가야하기 때문
    return Text(
      widget.label,
      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    //inkwell 체크
    return InkWell(
            onTap: (){
              widget.onTap(widget.value);
            },
      child: AspectRatio(
        aspectRatio: 2,
        child: Center(
          child:renderLabel(),
        ),
      ),
    );
  }
}
