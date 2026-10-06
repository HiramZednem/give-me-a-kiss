import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/presentation/widgets/kiss/chat.dart';
import 'package:give_me_a_kiss/src/presentation/widgets/kiss/kiss_stats.dart';

class KissScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ganate un beso'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            KissStats(
              opportunities: 3,
              losses: 2,
              wins: 1,
              kisses: 1,
            ),
            Expanded(child: Chat()),
          ],
        ),
      ),
    );
  }
}