

import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  String text;

  MyMessageBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(25)
                ), 
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(text, style: TextStyle(color: Colors.white),),
                )
              ),
            ),
                
            SizedBox(height: 50,)
          ],
        )
      ],
    );
  }
}