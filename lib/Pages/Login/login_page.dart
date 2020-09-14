import 'package:flutter/material.dart';
import 'package:green_field/Pages/Login/components/body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
