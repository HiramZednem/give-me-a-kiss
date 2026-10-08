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
        ChangeNotifierProvider(
          create: (context) => ChatProvider(context.read<StatsProvider>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ganate un beso',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFFC928),
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: const Color(0xFFFFF9E8),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFE082),
            foregroundColor: Color(0xFF493900),
            elevation: 0,
            centerTitle: false,
          ),
        ),
        home: const KissScreen(),
      ),
    );
  }
}
