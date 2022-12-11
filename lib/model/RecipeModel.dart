import 'package:firebase_auth/firebase_auth.dart';

class Recipe {
  final String id;
  // final String recipeImage;
  final String recipeName;
  final String serves;
  final String person;
  final String pTime;
  final String cTime;
  final String stepName;
  final String instruction;
  final String personal;

  const Recipe({
    this.id='',
    // required this.recipeImage,
    required this.recipeName,
    required this.serves,
    required this.person,
    required this.pTime,
    required this.cTime,
    required this.stepName,
    required this.instruction,
    required this.personal,

  });
  Map<String,dynamic> toJson()=>{
    'id':id,
    // 'recipeImage':recipeImage,
    'recipeName':recipeName,
    'serves':serves,
    'person':person,
    'pTime':pTime,
    'cTime':cTime,
    'stepName':stepName,
    'instruction':instruction,
    'personal':personal,

  };

  static Recipe fromJson(Map<String,dynamic> json)=>Recipe(
    id:json['id'],
    // recipeImage:json['recipeImage'],
    recipeName:json['recipeName'],
    serves:json['serves'],
    person:json['person'],
    pTime:json['pTime'],
    cTime:json['cTime'],
    stepName:json['stepName'],
    instruction:json['instruction'],
    personal:json['personal'],

  );
}