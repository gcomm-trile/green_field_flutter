import 'package:fluro/fluro.dart' as ModularRouter;
import 'package:flutter/material.dart';
import 'package:green_field/Pages/Login/login_page.dart';
import 'package:green_field/Pages/Survey/survey_page.dart';
import 'package:green_field/Pages/SurveysList/surveys_list_page.dart';

class FluroRouter {
  static ModularRouter.Router router = ModularRouter.Router();
  static ModularRouter.Handler _loginHandler = ModularRouter.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LoginPage());

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
    router.define('login',
        handler: _loginHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);

    router.define('surveys_list/:username', // username is a named parameter
        handler: _surveysListHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);
    router.define('survey', // username is a named parameter
        handler: _surveyHandler,
        transitionType: ModularRouter.TransitionType.inFromBottom);
  }
}
