import 'package:flutter/material.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "sura-details";

  @override
  Widget build(BuildContext context) {
    suraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as suraDetailsArgs;
    LoadSuraFile(args.index);

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/default_bg.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.suraName),
          ),
          body: Container(),
        ));
  }

  void LoadSuraFile(int index) {}
}

class suraDetailsArgs {
  int index;
  String suraName;
  suraDetailsArgs(this.index, this.suraName);
}
