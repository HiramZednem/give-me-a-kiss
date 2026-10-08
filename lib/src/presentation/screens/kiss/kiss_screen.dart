import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/presentation/widgets/kiss/chat.dart';
import 'package:give_me_a_kiss/src/presentation/widgets/kiss/kiss_stats.dart';
import 'package:give_me_a_kiss/src/presentation/widgets/shared/input.dart';

class KissScreen extends StatelessWidget {
  const KissScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ganate un beso',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(
              'Un poquito de amor y matemáticas',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: CircleAvatar(
              radius: 31,
              backgroundColor: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(3),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('lib/src/assets/kisser.jpeg'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const KissStats(),
              const SizedBox(height: 14),
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFFFFEDB3)),
                  ),
                  child: const Chat(),
                ),
              ),
              const SizedBox(height: 12),
              const Input(),
            ],
          ),
        ),
      ),
    );
  }
}
