import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wtf_assignment/controller/AuthController.dart';
import 'package:wtf_assignment/controller/RecipeController.dart';
import 'package:wtf_assignment/view/screens/Ingredients.dart';
import 'package:wtf_assignment/view/widgets/CustomText.dart';
import 'package:wtf_assignment/view/widgets/CustomTextField.dart';

import 'Steps.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  TextEditingController recipeNameController=TextEditingController();
  TextEditingController servController=TextEditingController();
  TextEditingController personController=TextEditingController();
  TextEditingController pTimeController=TextEditingController();
  TextEditingController cTimeController=TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.orangeAccent.withOpacity(0.2)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      TextButton(onPressed: (){},
                          child: Column(
                            children: [
                              const Text("Recipe",style: TextStyle(color: Colors.red),),
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
                          ),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: (){},
                    child: const Text("Ingredients",style: TextStyle(color: Colors.black))
                ),
                TextButton(onPressed: (){},
                    child: const Text("Steps",style: TextStyle(color: Colors.black))
                )
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
                    SizedBox(
                      height: height/7.4,
                      width: width/3.5,
                      child: Card(
                        child: IconButton(
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
                  children: [
                    Expanded(
                      child:CustomTextField(controller: recipeNameController,labelText: "Recipe name (Ex :Vegetable Upama)",),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  children: const [
                    Text("Serves",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width/3,
                        child: CustomTextField(controller:servController, labelText: 'Ex : 2',)
                    ),
                    SizedBox(width: width/6,),
                    SizedBox(
                      width: width/3,
                        child: CustomTextField(controller:personController, labelText: 'Person',)
                    ),

                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const Text("Prep time",style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        SizedBox(
                            width: width/3,
                            child: CustomTextField(controller:pTimeController, labelText: '00:00',)
                        ),
                      ],
                    ),
                    SizedBox(width: width/6,),
                    Column(
                      children: [
                        const Text("Cook time",style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        SizedBox(
                            width: width/3,
                            child: CustomTextField(controller:cTimeController, labelText: '00:00',)
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height:70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: ()async{
                        if(recipeNameController.text.isNotEmpty &&servController.text.isNotEmpty && personController.text.isNotEmpty &&
                        pTimeController.text.isNotEmpty && cTimeController.text.isNotEmpty){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>StepsScreen(
                          //   recipeImage: RecipeController.instance.recipeImg.toString(),
                          //   recipeName: recipeNameController.text,serves: servController.text,person: personController.text,
                          //   pTime: pTimeController.text,cTime: cTimeController.text,
                          // )));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StepsScreen(
                            recipeName: recipeNameController.text,serves: servController.text,person: personController.text,
                            pTime: pTimeController.text,cTime: cTimeController.text,
                          )));

                        }
                        Get.snackbar("Add All the Fields", "it is required to go next step");
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
    );
  }
}
