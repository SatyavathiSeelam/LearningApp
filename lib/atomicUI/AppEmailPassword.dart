import 'package:flutter/cupertino.dart';
import 'package:learning/util/Validations.dart';

import 'AppFormTextField.dart';

Widget AppEmailField({required TextEditingController emailController}){
  return AppFormTextField(
      title: "Email Address",
      controller: emailController,
      hintText: "hello@example.com",
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter email";
        } else if (!value.isValidEmail) {
          return "Enter valid email";
        }
        return null;
      });
}

Widget AppPasswordField({required TextEditingController passwordController, String titleString = "Set Password"}){
  return AppFormTextField(
      title: titleString ,
      controller: passwordController,
      hintText: "6+ Characters, 1 Capital letter",
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter password";
        }
        return null;
      });
}