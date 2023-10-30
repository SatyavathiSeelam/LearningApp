import 'package:flutter/material.dart';

class StateMgmntTextField extends StatefulWidget {
  const StateMgmntTextField({super.key});

  @override
  State<StateMgmntTextField> createState() => _StateMgmntTextFieldState();
}

class _StateMgmntTextFieldState extends State<StateMgmntTextField> {
  static const String hinText ="Entered data";
  String enteredData ="" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text("State Management", style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.indigoAccent,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(hinText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),),
            const SizedBox(height: 10,),
            Text(enteredData, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: Colors.green),),
            const SizedBox(height: 20,),
            TextField(onChanged: (value){
              setState(() {
                enteredData=value;
              });
            },)
          ],
        ),
      ),
    );
  }
}
