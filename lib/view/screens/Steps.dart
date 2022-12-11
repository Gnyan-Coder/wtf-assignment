
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wtf_assignment/view/widgets/CustomText.dart';
import 'package:wtf_assignment/view/widgets/CustomTextField.dart';

import '../../controller/RecipeController.dart';
import 'RecipeView.dart';

class StepsScreen extends StatefulWidget {
  // final String? recipeImage;
  final String recipeName;
  final String serves;
  final String person;
  final String pTime;
  final String cTime;
  const StepsScreen({Key? key,required this.recipeName,required this.serves,required this.person,
  required this.pTime,required this.cTime}) : super(key: key);

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  TextEditingController stepController=TextEditingController();
  TextEditingController instructionController=TextEditingController();
  TextEditingController personalController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Create Recipe",style: TextStyle(color: Colors.black),),
      ),
      body:  SingleChildScrollView(
        child: Column(
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
                            children: const [
                              Text("Ingredients",style: TextStyle(color: Colors.black)),

                            ],
                          )
                      ),
                      TextButton(onPressed: (){
                      },
                          child: Column(
                            children: [
                              const Text("Steps",style: TextStyle(color: Colors.red)),
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
                      )
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: height/7.4,
                        width: width/3.5,
                        child:  Card(
                          child:IconButton(
                              onPressed: (){
                                RecipeController.instance.pickImage();
                              },
                              icon: const Icon(Icons.camera_alt,size: 50,)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: const [
                      CustomText(),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: const [
                      Text("Step Name ",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child: CustomTextField(controller: stepController, labelText: "Ex: Fry Rawal Sooji"))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      Text("Instruction ",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child: SizedBox(
                        height: 150,
                          child: CustomTextField(controller: instructionController, labelText: "Ex: Fry Rawal Sooji")
                      ))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      Text("Personal Touch",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child: SizedBox(
                          height: 100,
                          child: CustomTextField(controller: personalController, labelText: "Ex: Fry Rawal Sooji")
                      ))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: ()async{
                          if(stepController.text.isNotEmpty && instructionController.text.isNotEmpty && personalController.text.isNotEmpty){
                            if(mounted){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const RecipeView()));
                            }
                            Get.snackbar("Recipe is Stored", "Successfully data stored");
                            // await RecipeController.instance.recipeAdd(File(widget.recipeImage.toString()),widget.recipeName, widget.serves,
                            //     widget.person, widget.pTime, widget.cTime, stepController.text,
                            //     instructionController.text,personalController.text);
                            await RecipeController.instance.recipeAdd(widget.recipeName, widget.serves,
                                widget.person, widget.pTime, widget.cTime, stepController.text,
                                instructionController.text,personalController.text);
                          }

                          Get.snackbar("Add All the Fields", "it is required");

                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                        child: const Icon(Icons.check),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
