import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/home_screen.dart';
import 'package:islamic/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islamic/tabs/quran/sura_details_screen.dart';
import 'package:islamic/tabs/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(), child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        },
        theme: AppTheme.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale( Provider.of<SettingProvider>(ctx).language),
        darkTheme: AppTheme.darkTheme,
        themeMode: Provider.of<SettingProvider>(ctx).themeMode,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
