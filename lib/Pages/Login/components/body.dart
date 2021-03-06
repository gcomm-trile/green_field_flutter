import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_field/Pages/SurveysList/surveys_list_page.dart';
import 'package:green_field/components/already_have_an_account_acheck.dart';
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
                text: "ĐĂNG NHẬP",
                press: () {
                  Navigator.pushNamed(context, 'surveys_list/:greenfield');
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
