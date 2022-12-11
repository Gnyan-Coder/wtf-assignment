import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Container(
      // width:width/0.7,
      decoration:const BoxDecoration(
          color: Colors.black
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Upload image of the recipe or do it later",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
