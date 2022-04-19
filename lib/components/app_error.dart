import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({Key? key, this.errortext}) : super(key: key);

  final String? errortext;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: null != errortext && errortext!.isNotEmpty,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            errortext!,
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ));
  }
}
