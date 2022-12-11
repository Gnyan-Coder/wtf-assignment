import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wtf_assignment/controller/RecipeController.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,

      ),
      body: SafeArea(
          child:isLoading?const Center(child: CircularProgressIndicator()):ListView.builder(
            itemCount: noteData.length,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height/5.5,
                        width: width/2.5,
                        child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.white.withOpacity(0.5),
                          child: const Center(child:Text("No Image",style: TextStyle(fontSize: 15),))
                        ),
                        ),
                      const SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(noteData[index]['recipeName'],style: const TextStyle(fontWeight: FontWeight.bold),),
                          const SizedBox(height: 5,),
                          Text("By ${_auth.currentUser!.email.toString()}")
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text("Prep time"),
                          Text("${noteData[index]["pTime"]}min",
                            style: const TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Cook time"),
                          Text("${noteData[index]["cTime"]}min",
                            style: const TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Serves"),
                          Text("${noteData[index]["serves"]} ${noteData[index]["person"]}",
                            style: const TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: const [
                      Text("Ingredients",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: width/1.5,
                        decoration:BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: const [
                      Text("Step 1",style: TextStyle(color: Colors.purple),)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(noteData[index]['stepName'],style: const TextStyle(fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          SizedBox(
                            height: height/6.5,
                            width: width/3.0,
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                color: Colors.white.withOpacity(0.5),
                                child: const Center(child:Text("No Image",style: TextStyle(fontSize: 15),))
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        children: [
                          SizedBox(
                            width: width/2,
                              child: Text(noteData[index]['instruction'],style: const TextStyle(),)),
                          const SizedBox(height: 5,),
                        ],
                      )
                    ],
                  ),
                  const Divider(height: 50,color: Colors.black,thickness: 1,)
                ],
              ),
            );
          })
      ),

    );
  }

  bool isLoading=true;
  List<dynamic> noteData=[];

  Future<List?> getData()async{
    final User? user=_auth.currentUser;
    if(user != null){
      List<dynamic> noteData1=(await RecipeController.instance.getAllRecipe())!;
      setState((){noteData=noteData1;});
      setState((){
        noteData=noteData1;
        isLoading=false;
      });
    }
    print(noteData.length);
    return noteData;
  }
}
