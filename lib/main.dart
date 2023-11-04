import 'package:flutter/material.dart';
import 'package:learning/educationalUI/CreateAccount.dart';
import 'package:learning/educationalUI/ForgotPassword.dart';
import 'package:learning/educationalUI/ResetPassword.dart';
import 'package:learning/educationalUI/SignIn.dart';
import 'package:learning/ui/ApiList.dart';
import 'package:learning/ui/StateMgmntTextField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/create_account",
      routes: {
        "/state_mgmnt_textfield": (context) => const StateMgmntTextField(),
        "/create_account": (context)=> const CreateAccount(),
        "/sign_in": (context)=> const SignIn(),
        "/forgot_password": (context)=> const ForgotPassword(),
        "/reset_password": (context)=> const ResetPassword(),
        "/api_list": (context)=> const ApiList(),
      },
    );
  }
}

