import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:green_field/Pages/Login/login_page.dart';
import 'package:green_field/Pages/SurveysList/surveys_list_page.dart';
import 'package:green_field/Pages/Welcome/conponents/background.dart';
import 'package:green_field/components/rounded_button.dart';
import 'package:green_field/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Đăng nhập",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Đăng kí",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.pushNamed(context, 'signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
