import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/presentation/providers/chat_provider.dart';
import 'package:give_me_a_kiss/src/presentation/providers/stats_provider.dart';
import 'package:give_me_a_kiss/src/presentation/screens/kiss/kiss_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StatsProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ganate un beso',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.yellow),
        ),
        home: KissScreen()
      ),
    );
  }
}

