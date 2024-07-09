import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> Azkar = [
    "سبحان الله",
    "الحمد الله",
    " الله اكبر",
  ];
  int index = 0;
  double angel = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset("assets/images/head_sebha_logo.png"),
              Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Transform.rotate(
                    angle: angel,
                    child: InkWell(
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: onTap,
                        child:
                            Image.asset("assets/images/body_sebha_logo.png")),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: Text("التسبيحات",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 30)),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "$counter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 22),
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "${Azkar[index]}",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  onTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter = 0;
    }
    if (index == Azkar.length) {
      index = 0;
    }
    angel += 360 / 33;
    setState(() {});
  }
}
