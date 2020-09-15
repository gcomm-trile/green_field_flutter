import 'package:fluro/fluro.dart' as ModularRouter;
import 'package:flutter/material.dart';
import 'package:green_field/Pages/Home/home_page.dart';
import 'package:green_field/Pages/Login/login_page.dart';
import 'package:green_field/Pages/Signup/signup_page.dart';
import 'package:green_field/Pages/Survey/survey_page.dart';
import 'package:green_field/Pages/SurveysList/surveys_list_page.dart';
import 'package:green_field/Pages/Welcome/welcome_page.dart';

class FluroRouter {
  static ModularRouter.Router router = ModularRouter.Router();

  static ModularRouter.Handler _welcomeHandler = ModularRouter.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WelcomePage());

  static ModularRouter.Handler _loginHandler = ModularRouter.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LoginPage());

  static ModularRouter.Handler _signupHandler = ModularRouter.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SignUpPage());
  static ModularRouter.Handler _homeHandler = ModularRouter.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomePage());
  static ModularRouter.Handler _surveysListHandler = ModularRouter.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SurveysListPage(username: params['username'][0]));

  static ModularRouter.Handler _surveyHandler = ModularRouter.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SurveyPage());

  // static ModularRouter.Handler _projectHandler = ModularRouter.Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //         ProjectPage(username: params['username'][0]));
  static void setupRouter() {
    router.define('welcome',
        handler: _welcomeHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);

    router.define('login',
        handler: _loginHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);
    router.define('signup',
        handler: _signupHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);
    router.define('home',
        handler: _homeHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);

    router.define('surveys_list/:username', // username is a named parameter
        handler: _surveysListHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);
    router.define('survey', // username is a named parameter
        handler: _surveyHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);
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
