import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/RecipeModel.dart';

class RecipeController extends GetxController {
  static RecipeController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<dynamic> recipeList = [];
  File? recipeImg;


  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final img = File(image.path);
    recipeImg = img;
  }

  Future<String> _uploadRecipePic(File image) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDownloadUrl = await snapshot.ref.getDownloadURL();
    return imageDownloadUrl;
  }


  recipeAdd(String recipeName, String serves, String person, String pTime,
      String cTime,
      String stepName, String instruction, String personal) async {
    final User? user = _auth.currentUser;
    if (recipeName.isNotEmpty && serves.isNotEmpty && person.isNotEmpty &&
        pTime.isNotEmpty &&
        cTime.isNotEmpty && stepName.isNotEmpty && instruction.isNotEmpty &&
        personal.isNotEmpty) {
      final docUser = await FirebaseFirestore.instance.collection("FoodRecipe")
          .doc(user!.email).collection("recipe")
          .doc();
      // String downloadUrl = await _uploadRecipePic(image);
      final note = Recipe(
          id: docUser.id,
          // recipeImage: downloadUrl,
          recipeName: recipeName,
          serves: serves,
          person: person,
          pTime: pTime,
          cTime: cTime,
          stepName: stepName,
          instruction: instruction,
          personal: personal
      );
      final json = note.toJson();
      await docUser.set(json);
    }
  }


  Future<List<dynamic>?> getAllRecipe()async{
    final User? user=_auth.currentUser;
    await FirebaseFirestore.instance.collection("FoodRecipe").doc(user!.email).collection("recipe").get().then((querySnapshot) async {
      for (var element in querySnapshot.docs){
        recipeList.add(element.data());
      }
    });
    return recipeList;
  }
}


