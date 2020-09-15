import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_field/Pages/Login/login_page.dart';
import 'package:green_field/Pages/Signup/conponents/background.dart';
import 'package:green_field/components/already_have_an_account_acheck.dart';
import 'package:green_field/components/rounded_button.dart';
import 'package:green_field/components/rounded_input_field.dart';
import 'package:green_field/components/rounded_password_field.dart';

class Body extends StatelessWidget {
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
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Tài khoản",
              onChanged: (value) {},
            ),
            RoundedPasswordField(),
            RoundedButton(
              text: "ĐĂNG KÍ",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
          ],
        ),
      ),
    );
  }
}
