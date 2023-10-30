import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/atomicUI/AppScaffold.dart';

import '../atomicUI/AppButton.dart';
import '../atomicUI/AppEmailPassword.dart';
import '../atomicUI/AppHeader.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold.withTitleBody(title: "Forgot Password", body: ForgotPasswordPage());
  }
}

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(24),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader.withSubHeader(
                header: "Forgot Password?",
                subHeader:
                "Enter the email associated with your account and we will send an authentication code to reset you password"),
            const SizedBox(
              height: 24,
            ),
            AppEmailField(emailController: emailController),
            const SizedBox(
              height: 24,
            ),
            AppButton(
                title: "Submit",
                onPressed: () {
                  Fluttertoast.showToast(msg: "Submit clicked");
                  Navigator.pushNamed(context, "/reset_password");
                }),
          ],
        ),
      ),
    );
  }
}

