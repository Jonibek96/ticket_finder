import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_finder/utils/app_colors.dart';

class SpeakingScreen extends StatefulWidget {
  const SpeakingScreen({super.key});

  @override
  State<SpeakingScreen> createState() => _SpeakingScreenState();
}

class _SpeakingScreenState extends State<SpeakingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Идет разработка",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600
            ),
          ),
          Icon(Icons.location_on_outlined, size: 50, color: AppColors.blueSpecial)
        ],
      ),
    );
  }
}
