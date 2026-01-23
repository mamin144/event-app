import 'package:event/core/routes/route_name.dart';
import 'package:event/features/layout/view/layout_view.dart';
import 'package:event/features/signup/view/signup.dart';
import 'package:flutter/material.dart';
import '../../features/forget_password/view/Forget_Password.dart';
import '../../features/login/ui/login.dart';
import '../../features/splash/splash_view.dart';

abstract class AppRouter{

  static Route<dynamic>? OnGenerateRoute(RouteSettings setting){
    switch(setting.name){
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => SplashView());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
        case RouteName.signup:
        return MaterialPageRoute(builder: (context) => SignUp());
         case RouteName.forgetPassword:
         return MaterialPageRoute(builder: (context) => ForgetPassword());
      case RouteName.layout:
        return MaterialPageRoute(builder: (context) => LayoutView());

      default:
        return MaterialPageRoute(builder: (context) => SplashView());
    }
  }
}