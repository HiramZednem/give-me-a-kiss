
import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/presentation/providers/stats_provider.dart';
import 'package:provider/provider.dart';

class KissStats extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int opportunities = context.watch<StatsProvider>().opportunities;
    int losses = context.watch<StatsProvider>().losses;
    int wins = context.watch<StatsProvider>().wins;
    int kisses = context.watch<StatsProvider>().kisses;

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