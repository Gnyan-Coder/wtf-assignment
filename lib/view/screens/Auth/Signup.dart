import 'package:flutter/material.dart';
import 'package:wtf_assignment/controller/AuthController.dart';

import '../../widgets/TextInputField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController conPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Welcome To WIT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  const SizedBox(height: 25,),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(controller: emailController, myIcon: Icons.email, myLabelText: "Email")
                  ),
                  const SizedBox(height: 25,),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(controller: passwordController, myIcon: Icons.lock, myLabelText: "Password",isHide: true,)
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: (){
                        AuthController.instance.signUp(emailController.text, passwordController.text);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                          child: const Text("Sign Up")
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}