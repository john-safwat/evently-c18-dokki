import 'package:evently_c18_dokki/core/l10n/app_localizations.dart';
import 'package:evently_c18_dokki/core/provider/app_config_provider.dart';
import 'package:evently_c18_dokki/core/utils/data_validator.dart';
import 'package:evently_c18_dokki/data/firebase_auth_service.dart';
import 'package:evently_c18_dokki/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "/signup";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordHidden = true;
  bool isPasswordConfirmHidden = true;
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var localization = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: .start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Image.asset(
                    "assets/images/logo_${provider.assetSuffix}.png",
                    width: MediaQuery.sizeOf(context).width * 0.4,
                  ),
                ],
              ),
            ),
            Text(
              localization.createYourAccount,
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                spacing: 16,
                children: [
                  TextFormField(
                    validator: (name) =>
                        DataValidator.nameValidation(name ?? "", localization),
                    autovalidateMode: .onUserInteraction,
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user_outline),
                      hintText: localization.enterYourName,
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (email) =>
                        DataValidator.validateEmail(email ?? "", localization),
                    autovalidateMode: .onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.sms_outline),
                      hintText: localization.enterYourEmail,
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (password) => DataValidator.validatePassword(
                      password ?? "",
                      localization,
                    ),
                    autovalidateMode: .onUserInteraction,
                    obscureText: isPasswordHidden,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.lock_1_outline),
                      hintText: localization.enterYourPassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                        child: Icon(
                          isPasswordHidden
                              ? Iconsax.eye_slash_outline
                              : Iconsax.eye_outline,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: passwordConfirmationController,
                    obscureText: isPasswordConfirmHidden,
                    validator: (password) =>
                        DataValidator.validatePasswordConfirmation(
                          password ?? "",
                          passwordController.text,
                          localization,
                        ),
                    autovalidateMode: .onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.lock_1_outline),
                      hintText: localization.confirmYourPassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordConfirmHidden = !isPasswordConfirmHidden;
                          });
                        },
                        child: Icon(
                          isPasswordConfirmHidden
                              ? Iconsax.eye_slash_outline
                              : Iconsax.eye_outline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 0),
              ),
              onPressed: () async {
                if (isLoading) return;
                if (formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  FirebaseAuthService authService = FirebaseAuthService();
                  var user = await authService
                      .createAccountWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                      );
                  setState(() {
                    isLoading = false;
                  });
                  if (user?.uid != null) {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.routeName,
                    );
                  }
                }
              },
              child: isLoading
                  ? CircularProgressIndicator(color: theme.colorScheme.surface,)
                  : Text(localization.signup),
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(localization.alreadyHaveAnAccount),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.routeName,
                    );
                  },
                  child: Text(localization.login),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: theme.colorScheme.secondary.withAlpha(40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    localization.or,
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: theme.colorScheme.secondary.withAlpha(40),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // todo google signup
              },
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Brand(Brands.google),
                  SizedBox(width: 16),
                  Text(localization.signUpWithGoogle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
