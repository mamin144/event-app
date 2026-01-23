// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get email => 'Enter your email';

  @override
  String get password => 'Enter your password';

  @override
  String get rePassword => 'Confirm your password';

  @override
  String get forgetPassword => 'Forget Password';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get login => 'Login';

  @override
  String get dontHaveAnAccount => 'Don’t Have Account ? ';

  @override
  String get createAccount => 'Sign up';

  @override
  String get or => 'Or';

  @override
  String get loginWithGoogle => 'Login With Google';

  @override
  String get name => 'Enter your Name';

  @override
  String get alreadyHaveAnAccount => 'Already Have Account ? ';
}
