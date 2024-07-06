import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura-details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    suraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as suraDetailsArgs;
    if (ayat.isEmpty) {
      LoadSuraFile(args.index);
    }

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/default_bg.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                args.suraName,
              ),
            ),
            body: ayat.isEmpty
                ? Center(child: LoadingIndicator())
                : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    
                  ),
                  padding: EdgeInsets.all(22),
                  margin: EdgeInsets.all(25),
                  child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                        ayat[index],
                        style: Theme.of(context).textTheme.titleLarge,
                        textDirection: TextDirection.rtl,
                      ),
                      itemCount: ayat.length,
                    ),
                )));
  }

  Future<void> LoadSuraFile(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    ayat = sura.split('\n');
    setState(() {});
  }
}

class suraDetailsArgs {
  int index;
  String suraName;
  suraDetailsArgs(this.index, this.suraName);
}
