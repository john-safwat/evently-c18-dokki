
import 'package:evently_c18_dokki/core/l10n/app_localizations.dart';

abstract class DataValidator{

  static String? nameValidation(String name , AppLocalizations localization){
    if (name.isEmpty) {
      return localization.nameRequired;
    }
    final nameRegex = RegExp(r'^[a-zA-Z\u0621-\u064A\s]+$');
    if (!nameRegex.hasMatch(name)) {
      return localization.invalidName;
    }
    return null;
  }

  static String? validateEmail(String email , AppLocalizations localization){
    if (email.isEmpty) {
      return localization.emailRequired;
    }
    final emailRegex = RegExp(r'^[\w\.\-]+@[\w\-]+\.[\w\.\-]+$');
    if (!emailRegex.hasMatch(email)) {
      return localization.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String password , AppLocalizations localization){
    if (password.isEmpty) {
      return localization.passwordRequired;
    }
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]).{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      return localization.invalidPassword;
    }
    return null;
  }


  static String? validatePasswordConfirmation(String password , String passwordConfirmation , AppLocalizations localization){
    if (passwordConfirmation.isEmpty) {
      return localization.passwordConfirmationRequired;
    }
    if (passwordConfirmation != password) {
      return localization.passwordsDoNotMatch;
    }
    return null;
  }

}