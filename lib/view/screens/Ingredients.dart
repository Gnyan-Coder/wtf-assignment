import 'package:flutter/material.dart';

class IngredientsScreen extends StatelessWidget {
  const IngredientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Create Recipe",style: TextStyle(color: Colors.black),),
      ),
      body:  Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.orangeAccent.withOpacity(0.2)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          TextButton(onPressed: (){},
                            child: const Text("Recipe",style: TextStyle(color: Colors.black),),
                          ),
                        ],
                      ),
                    ),
                    TextButton(onPressed: (){},
                        child: Column(
                          children: [
                            const Text("Ingredients",style: TextStyle(color: Colors.red)),
                            const SizedBox(height: 5,),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                            )
                          ],
                        )
                    ),
                    TextButton(onPressed: (){},
                        child: Text("Steps",style: TextStyle(color: Colors.black))
                    )
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
