//import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final dynamic error;
  final VoidCallback tryAgain;
  const AppErrorWidget({Key? key, this.error, required this.tryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('$error'),
        ),
        TextButton(onPressed: tryAgain, child: Text('Try again'))
      ],
    );
  }
}
