import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_field/Pages/SurveysList/surveys_list_page.dart';
import 'package:green_field/components/rounded_button.dart';
import 'package:green_field/components/rounded_input_field.dart';
import 'package:green_field/components/rounded_password_field.dart';
import 'background.dart';
import 'dart:developer';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Tài khoản",
              onChanged: (value) {},
            ),
            RoundedPasswordField(),
            RoundedButton(
                text: "LOGIN",
                press: () {
                  _login(context);
                }),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    log("user login");
    Navigator.of(context).push(_createRoute());
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SurveysListPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
