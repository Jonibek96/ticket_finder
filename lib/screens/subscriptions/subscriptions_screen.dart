import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
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
            Icons.supervisor_account_rounded,
            size: 50,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
