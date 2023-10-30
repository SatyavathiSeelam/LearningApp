import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/atomicUI/AppButton.dart';
import 'package:learning/atomicUI/AppEmailPassword.dart';
import 'package:learning/atomicUI/AppFormTextField.dart';
import 'package:learning/atomicUI/AppHeader.dart';
import 'package:learning/atomicUI/AppScaffold.dart';
import 'package:learning/atomicUI/AppDropDown.dart';
import 'package:learning/util/Validations.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold.withTitleBody(
        title: "Create Account", body: CreateAccountPage());
  }
}

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String selectedItem = "Jan 2023";

  List<String> itemsList = [
    "Jan 2023",
    "Feb 2023",
    "March 2023",
    "April 2023",
    "May 2023",
    "June 2023",
    "July 2023",
    "Aug 2023"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader.withSubHeader(header: "Let’s Get Started!", subHeader: 'Welcome back. Enter your credentials to access your account',),
              const SizedBox(height: 18),
              AppFormTextField(
                  title: "Name",
                  controller: nameController,
                  hintText: "Enter name",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  }),
              const SizedBox(height: 24),
              AppFormTextField(
                  title: "Mobile Number",
                  controller: mobileNumberController,
                  hintText: "Enter Mobile Number",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Mobile Number";
                    } else if (!value.isValidPhone) {
                      return "Enter valid Mobile Number";
                    }
                    return null;
                  }),
              const SizedBox(height: 24),
              AppEmailField(emailController: emailController),
              const SizedBox(height: 24),
              AppDropDown(
                  title: "Batch Number",
                  items: itemsList,
                  selectedItem: selectedItem,
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value!;
                    });
                  }),
              const SizedBox(height: 24),
             AppPasswordField(passwordController: passwordController),
              const SizedBox(height: 24),
              AppButton(
                  title: "Create Account",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Fluttertoast.showToast(
                          msg: "Validation successful",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pushNamed(context, "/sign_in");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
