import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser{
  String email;
  String uid;
  MyUser({required this.email,required this.uid,});

  //App -Firebase
  Map<String ,dynamic> toJson(){
    return{
      "email":email,
      "uid":uid,
    };
  }
  //Firebase-App
  static MyUser fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return MyUser(email: snapshot["email"], uid: snapshot["uid"],);
  }

}