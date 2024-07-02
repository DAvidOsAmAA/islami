import 'package:flutter/material.dart';
import 'package:islamic/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/radio/radio_tab.dart';
import 'package:islamic/tabs/sebha/sebha_tab.dart';
import 'package:islamic/tabs/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    HadethTab(),
    RadioTab(),
    SettingTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/default_bg.png"))
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("اسلامي"),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
              label: "Quran", // Corrected label
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
              label: "Sebha",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/radio_image.png")),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
            ),
            
          ],
        ),
      ),
    );
  }
}
