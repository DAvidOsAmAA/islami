import 'package:flutter/material.dart';
import 'package:islamic/Widgets/loading_indicator.dart';
import 'package:islamic/tabs/hadeth/hadeth_class.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/default_bg.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              hadeth.title,
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            padding: EdgeInsets.all(22),
            margin: EdgeInsets.all(25),
            child: ListView.builder(
              itemBuilder: (context, index) => Text(
                hadeth.content[index],
                style: Theme.of(context).textTheme.titleLarge,
                textDirection: TextDirection.rtl,
              ),
              itemCount: hadeth.content.length,
            ),
          ),
        ));
  }
}
