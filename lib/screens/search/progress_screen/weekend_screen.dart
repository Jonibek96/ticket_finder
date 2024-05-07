import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class WeekendScreen extends StatelessWidget {
  const WeekendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.black,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          "Выходные",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: const Center(
        child: Text(
          "Страница в разработке",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
