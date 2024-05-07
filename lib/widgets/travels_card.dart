import 'package:flutter/material.dart';

import '../screens/search/search_screen.dart';

class TravelsCard extends StatelessWidget {
  final MenuTravel menuTravel;
  const TravelsCard({super.key, required this.menuTravel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 100,
      child: Column(
        children: [
          Image.asset(menuTravel.image, width: 48, height: 48, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(
            menuTravel.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14
            ),
          )
        ],
      ),
    );
  }
}
