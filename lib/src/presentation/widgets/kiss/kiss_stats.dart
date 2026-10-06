
import 'package:flutter/material.dart';

class KissStats extends StatelessWidget {
  int opportunities;
  int losses;
  int wins;
  int kisses; 

  KissStats({
    super.key,
    required this.opportunities,
    required this.losses,
    required this.wins,
    required this.kisses
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 30,
            children: [
              Text('❤️ $opportunities'),
              Text('💔 $losses'),
              Text('😍 $wins'),
              Text('💋 $kisses'),
            ],
          ),
        ),
        IconButton(
          onPressed: null, 
          icon: Icon(Icons.info)
        )
      ],
    );
  }
}