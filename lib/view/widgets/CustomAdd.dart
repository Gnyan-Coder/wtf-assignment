import 'package:flutter/material.dart';

class CustomAdd extends StatelessWidget {
  const CustomAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.purple,
            borderRadius: BorderRadius.circular(10.0)
      ),
      child: const Icon(Icons.add),
    );
  }
}
