import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  List<language> languages = [
    language(name: "English", code: "en"),
    language(name: "العربية", code: "ar")
  ];
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark Mode",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Switch(
                value: settingProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  if (value == true) {
                    settingProvider.changeTheme(ThemeMode.dark);
                  } else {
                    settingProvider.changeTheme(ThemeMode.light);
                  }
                },
                activeTrackColor: Theme.of(context).primaryColor,
                inactiveTrackColor: Theme.of(context).primaryColor,
                thumbColor: WidgetStatePropertyAll(AppTheme.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Language",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600)),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.3,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<language>(
                      value: languages.firstWhere(
                          (lang) => lang.code == settingProvider.language),
                      items: languages
                          .map((language) => DropdownMenuItem(
                                child: Text(
                                  language.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                value: language,
                              ))
                          .toList(),
                      onChanged: (selectedValue) {
                        if (selectedValue != null)
                          settingProvider.changeLanguage(selectedValue.code);
                      }),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class language {
  String name;
  String code;

  language({required this.name, required this.code});
}
