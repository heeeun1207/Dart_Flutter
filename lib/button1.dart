import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: OutlinedButton(
            onPressed: (){},
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text('아웃라인드 버튼'),
          ),
        ),
      ),
    );
  }
}
