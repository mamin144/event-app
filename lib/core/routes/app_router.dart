import 'package:event/core/routes/route_name.dart';
import 'package:event/features/add_event/view/add_event_view.dart';
import 'package:event/features/layout/view/layout_view.dart';
import 'package:event/features/onBoarding/theme_view.dart';
import 'package:event/features/signup/view/signup.dart';
import 'package:event/features/view_Details/view/View_Details.dart';
import 'package:flutter/material.dart';
import '../../features/Home/view/homeView.dart';
import '../../features/favourite/view/favorite_view.dart';
import '../../features/forget_password/view/Forget_Password.dart';
import '../../features/login/ui/login.dart';
import '../../features/onBoarding/onBoarding_view.dart';
import '../../features/splash/splash_view.dart';

abstract class AppRouter {
  static Route<dynamic>? OnGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
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
      case RouteName.addEvent:
        return MaterialPageRoute(builder: (context) => AddEventView());
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case RouteName.favorite:
        return MaterialPageRoute(builder: (context) => FavoriteView());
      case RouteName.viewDetails:
        final eventId = setting.arguments as String;

        return MaterialPageRoute(builder: (_) => ViewDetails(eventId: eventId));

      case RouteName.theme:
        return MaterialPageRoute(builder: (context) => ThemeView());
        case RouteName.onBoarding:
        return MaterialPageRoute(builder: (context) => OnboardingView());

      default:
        return MaterialPageRoute(builder: (context) => ThemeView());
    }
  }
}
