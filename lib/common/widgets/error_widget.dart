//import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final dynamic error;
  const ErrorWidget({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$error'),
    );
  }
}
