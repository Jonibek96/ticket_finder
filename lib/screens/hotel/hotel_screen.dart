import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
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
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Icon(
            Icons.emoji_emotions_sharp,
            size: 50,
            color: Colors.yellowAccent,
          )
        ],
      ),
    );
  }
}
