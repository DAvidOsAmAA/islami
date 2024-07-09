import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Image.asset("assets/images/radio_image.png"),
          SizedBox(
            height: 40,
          ),
          Text("ازاعة القرأن الكريم",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 30)),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_arrow),
                color: const Color.fromARGB(255, 148, 112, 4),
                  iconSize: 50,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.pause),
                color: const Color.fromARGB(255, 148, 112, 4),
                iconSize: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
