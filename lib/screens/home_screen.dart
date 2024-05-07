import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_finder/screens/profile/profile_screen.dart';
import 'package:ticket_finder/screens/search/search_screen.dart';
import 'package:ticket_finder/screens/speaking/speaking_screen.dart';
import 'package:ticket_finder/screens/subscriptions/subscriptions_screen.dart';
import 'package:ticket_finder/utils/app_colors.dart';

import 'hotel/hotel_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens =  [
    const SearchScreen(),
    const HotelScreen(),
    const SpeakingScreen(),
    const SubscriptionsScreen(),
    const ProfileScreen(),
  ];
  int currentIndexScreen = 0;

  final TextStyle _selectedLabelStyle = const TextStyle(
    color: AppColors.blueSpecial,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  final TextStyle _unselectedLabelStyle = const TextStyle(
    color: AppColors.grey4,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: screens[currentIndexScreen],
      bottomNavigationBar:BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        enableFeedback: true,
        backgroundColor: AppColors.black,
        unselectedItemColor: AppColors.grey4,
        selectedItemColor: AppColors.blue,
        currentIndex: currentIndexScreen,
        selectedLabelStyle: _selectedLabelStyle,
        unselectedLabelStyle: _unselectedLabelStyle,
        onTap: (index) => setState(() {
          currentIndexScreen = index;
        }),
        items:  [
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/air.svg", color: selectColorIcon(0)), label: "Авиабилеты",),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/hottel.svg", color: selectColorIcon(1)), label: "Отели "),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/location.svg", color: selectColorIcon(2)), label: "Короче"),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/subs.svg", color: selectColorIcon(3)), label: "Подписки"),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/person.svg", color: selectColorIcon(4)), label: "Профиль"),
        ],
      ),
    );
  }

  Color selectColorIcon(int index) {
    return currentIndexScreen == index ? AppColors.blueSpecial : AppColors.grey4;
  }
}
