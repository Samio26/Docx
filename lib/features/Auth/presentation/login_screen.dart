import 'package:flutter/material.dart';
import 'package:testt/config/core/widgets/custom_button.dart';
import 'package:testt/config/core/widgets/form_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

final TextEditingController emailController=TextEditingController();
final TextEditingController passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child:  Column(
            children: [
              Spacer(),
              const Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              CustomTextField(labelText: "Email", controller:emailController),
              const SizedBox(height: 15),
              CustomTextField(labelText: "password", controller: passController),
              const SizedBox(height: 20,),
              CustomButton(text: "Login", onPressed: (){
                
              }),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}