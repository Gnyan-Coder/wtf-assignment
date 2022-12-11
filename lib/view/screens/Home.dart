import 'package:flutter/material.dart';
import 'package:wtf_assignment/view/screens/Recipe.dart';

import '../widgets/CustomAdd.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Create Recipe",style: TextStyle(color: Colors.black),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:Colors.white,
        onTap: (index){
          setState(() {
            pageIdx=index;
          });
        },
        currentIndex: pageIdx,
        items:const [
          BottomNavigationBarItem(
              icon:Icon(Icons.home,size: 30,),
            label: ''
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.search,size: 30,),
              label: ''
          ),
          BottomNavigationBarItem(
              icon:CustomAdd(),
              label: ''
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.account_circle,size: 30,),
              label: ''
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.add_chart_outlined,size: 30,),
              label: ''
          )
        ],
      ),
      body: RecipeScreen(),
    );
  }
}
