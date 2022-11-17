import 'package:flutter/material.dart';
import 'package:funny_kakaokeyboard/Screen/KeyboardKeyboardComponent.dart';
import 'package:intl/intl.dart';

class kakaoKeyPad extends StatefulWidget {
  @override
  State<kakaoKeyPad> createState() => _kakaoKeyboardState();
}

class _kakaoKeyboardState extends State<kakaoKeyPad> {
  //추후에 데이터를 추가해준다는 약속 late
  late List<List<dynamic>> keys;
  late String amount;

  @override
  void initState() {
    super.initState();

    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['00', '0', Icon(Icons.keyboard_backspace)],
    ];
    amount = '';
  }

  onKeyTap(val) {
    // 조건 3개 다니까 오류떠서 2중 if로 해결
    if (val == '0' && amount.length == 0) {
      return;
    } else if (val == '00' && amount.length == 0) {
      return;
    }

    setState(() {
      amount = amount + val;
    });
  }

  onBackspacepress() {
    if (amount.length == 0) {
      return;
    }
    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  renderKeyboard() {
    return keys
        // 배열.map은 배열의 요소 하나씩을 뱉어낸다
        // x는 [123],[456],[789]
        .map(
          (x) => Row(
            children: x.map(
              // y는 1,2,3 / 4, 5, 6 etc...
              (y) {
                return Expanded(
                  child: KeyboardKey(
                      label: y,
                      onTap: (value) {
                        if (value is Widget) {
                          onBackspacepress();
                        } else {
                          onKeyTap(value);
                        }
                      },
                      value: y),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  renderAmount() {
    String display = '보낼금액';
    TextStyle style = TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.grey);

    if (this.amount.length > 0) {
      //intl 패키지
      NumberFormat f = NumberFormat('#,###');

      display = f.format(int.parse(amount)) + '원';
      style = style.copyWith(color: Colors.black);
    }
    return Expanded(
        child: Center(
            child: Text(
      display,
      style: style,
    )));
  }

  renderConfirmButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //활성화
                    primary: Color(0xffffe404),
                    //비활성화
                    onSurface: Colors.grey[400],
                  ),
                  //삼황연산자로 버튼 상태 반환
                  onPressed: amount.length > 0 ? (){} : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      '확인',
                      style: TextStyle(
                          color: amount.length > 0 ? Colors.black : Colors.grey,  fontWeight: FontWeight.bold),
                    ),
                  ))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      renderAmount(),
      /*spread로 하나의 배열을 이어붙입니다
       *   var mylist = [1,2,3];
       *   var mylist2 = [10, ...mylist;    [10, 1, 2, 3]
       *   var mylist3 = [10,mylist;        [10, [1, 2, 3]]
       */
      ...renderKeyboard(),
      renderConfirmButton()
    ])));
  }
}
