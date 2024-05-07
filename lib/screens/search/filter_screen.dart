import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_finder/widgets/switch_button.dart';

import '../../utils/app_colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Пересадки',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2F3035),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Без пересадок',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        SwitchButton(switchValue: true)
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2F3035),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Только с багажом',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        SwitchButton(switchValue: true)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF2F3035),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.clear, color: Colors.white),
      ),
      title: const Text(
        'Фильтры',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
