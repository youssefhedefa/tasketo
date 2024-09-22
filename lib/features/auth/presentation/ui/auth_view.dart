import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key, required this.formTitle, required this.form, required this.formSubTitle});

  final String formTitle;
  final String formSubTitle;
  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18,right: 18 ,top: 90),
        child: SingleChildScrollView(
          child: form,
        ),
      ),
    );
  }
}
