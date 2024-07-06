import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islamic/tabs/hadeth/hadeth_class.dart';
import 'package:islamic/tabs/hadeth/hadeth_details_screen.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset("assets/images/hadeth_logo.png"),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? Text("loading Indecatior")
              : ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        HadethDetailsScreen.routeName,
                      arguments: ahadeth[index]);
                    },
                    child: Text(
                      ahadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: 50,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');

    List<String> ahadethStrings = ahadethFileContent.split("#");

    ahadeth = ahadethStrings.map((ahadethString) {
      List<String> hadethLines = ahadethString.trim().split("\n");

      String title = hadethLines[0];

      hadethLines.removeAt(0);

      List<String> content = hadethLines;

      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}
