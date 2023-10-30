import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/atomicUI/AppScaffold.dart';

import '../atomicUI/AppButton.dart';
import '../atomicUI/AppEmailPassword.dart';
import '../atomicUI/AppHeader.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold.withTitleBody(title: "Reset Password", body: ResetPasswordPage());
  }
}

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
            AppHeader.withHeader(
                header: "Reset Password?",
            ),
            const SizedBox(
              height: 24,
            ),
            AppPasswordField(passwordController: passwordController, titleString: "Set New Password"),
            const SizedBox(
              height: 24,
            ),
            AppPasswordField(passwordController: confirmPasswordController, titleString: "Confirm Password"),
            const SizedBox(
              height: 24,
            ),
            AppButton(
                title: "Submit",
                onPressed: () {
                  Fluttertoast.showToast(msg: "Login clicked");
                }),
          ],
        ),
      ),
    );
  }
}

