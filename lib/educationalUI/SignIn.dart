import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/atomicUI/AppButton.dart';
import 'package:learning/atomicUI/AppEmailPassword.dart';
import 'package:learning/atomicUI/AppFormTextField.dart';
import 'package:learning/atomicUI/AppHeader.dart';
import 'package:learning/atomicUI/AppScaffold.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold.withTitleBody(
        title: "State Management", body: SingInPage());
  }
}

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("images/profile.png"),
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 12,
              ),
              AppHeader.withSubHeader(
                  header: "Welcome back",
                  subHeader:
                      "Welcome back. Enter your credentials to access your account"),
              const SizedBox(
                height: 24,
              ),
              AppEmailField(emailController: emailController),
              const SizedBox(
                height: 24,
              ),
              AppPasswordField(passwordController: passwordController, titleString: "Password"),
              const SizedBox(
                height: 24,
              ),
              AppButton(
                  title: "Login",
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Login clicked");
                    if(_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, "/forgot_password");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
