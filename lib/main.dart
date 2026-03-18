import 'package:evently_c18_dokki/core/l10n/app_localizations.dart';
import 'package:evently_c18_dokki/core/provider/app_config_provider.dart';
import 'package:evently_c18_dokki/core/theme/app_theme.dart';
import 'package:evently_c18_dokki/core/utils/shared_prefernces_keys.dart';
import 'package:evently_c18_dokki/ui/app_setup/app_setup_screen.dart';
import 'package:evently_c18_dokki/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppConfigProvider provider;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppConfigProvider();
      },
      child: Consumer<AppConfigProvider>(
        builder: (context, provider, _) {
          this.provider = provider;
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(provider.local),
            themeMode: provider.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (_) => SplashScreen(),
              AppSetupScreen.routeName: (_) => AppSetupScreen(),
            },
          );
        },
      ),
    );
  }

  Future<void> init() async {
    final pref = await SharedPreferences.getInstance();
    var locale = pref.getString(SharedPreferencesKeys.locale.name) ?? "en";
    var isDark = pref.getBool(SharedPreferencesKeys.isDark.name) ?? false;

    provider.changeTheme(isDark ? ThemeMode.dark : ThemeMode.light);
    provider.changeLocal(locale);
  }
}
