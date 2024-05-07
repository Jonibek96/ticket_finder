import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_finder/bloc/offer/offer_bloc.dart';
import 'package:ticket_finder/bloc/offer/offer_state.dart';
import 'package:ticket_finder/screens/search/progress_screen/difficult_route.dart';
import 'package:ticket_finder/screens/search/progress_screen/hot_tickets_screen.dart';
import 'package:ticket_finder/screens/search/progress_screen/weekend_screen.dart';
import 'package:ticket_finder/screens/search/search_country_selected.dart';
import 'package:ticket_finder/services/api_service.dart';
import 'package:ticket_finder/utils/app_colors.dart';
import 'package:ticket_finder/widgets/card_offer.dart';
import 'package:ticket_finder/widgets/popular_destination_card.dart';

import '../../bloc/offer/offer_event.dart';
import '../../widgets/app_button.dart';
import '../../widgets/travels_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controllerArrivalTown = TextEditingController();
  TextEditingController controllerLandingTown = TextEditingController();
  bool isLoaded = false;

  List<MenuTravel> menuTravels = [
    MenuTravel(name: "Сложный маршрут", image: "assets/icons/travel.png"),
    MenuTravel(name: "Куда угодно", image: "assets/icons/travel2.png"),
    MenuTravel(name: "Выходные", image: "assets/icons/travel3.png"),
    MenuTravel(name: "Горячие билеты", image: "assets/icons/travel4.png"),
  ];

  List<PopularDestination> popularDestinations = [
    PopularDestination(city: "Стамбул", image: "assets/images/popular1.png"),
    PopularDestination(city: "Сочи", image: "assets/images/popular2.png"),
    PopularDestination(city: "Пхукет", image: "assets/images/popular3.png"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    controllerArrivalTown.text = 'Москва';
    controllerLandingTown.text = 'Куда - Турция';
    super.initState();
  }

  @override
  void dispose() {
    controllerArrivalTown.dispose();
    controllerLandingTown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OfferBloc(apiService: ApiService())..add(LoadOffer()),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          const SizedBox(height: 60),
          const Text(
            'Поиск дешевых\nавиабилетов',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFd9d9d9),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 34),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color(0xFF2F3035),
                borderRadius: BorderRadius.circular(16)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              decoration: BoxDecoration(
                  color: const Color(0xFF3E3F43),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 4))
                  ]),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/icon-search.svg"),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        buildTextField(controllerArrivalTown, Colors.white,
                            onTap: () {}),
                        const Divider(color: AppColors.grey3),
                        buildTextField(controllerLandingTown, AppColors.grey4,
                            onTap: () {
                          setState(() {
                            showModalBottomSheetFunc(context);
                          });
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 34),
          BlocBuilder<OfferBloc, OfferState>(builder: (context, state) {
            if (state is OfferLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else if (state is OfferLoaded) {
              final offers = state.offers;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(offers.length, (index) {
                    return CardOffer(offers: offers, index: index);
                  }),
                ),
              );
            } else if (state is OfferError) {
              return Text(
                state.error,
                style: const TextStyle(color: Colors.white),
              );
            }
            return const SizedBox();
          }),
          const SizedBox(height: 38),
          AppButton(
            name: "Показать все места",
            bgColor: const Color(0xFF2F3035),
            textColor: Colors.white,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, Color colorText,
      {required GestureTapCallback onTap}) {
    return SizedBox(
      //height: 20,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          decoration: TextDecoration.none,
          decorationThickness: 0,
          color: colorText,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[а-я А-Я 0-9]")),
        ],
        onTap: onTap,
        readOnly: true,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: -3),
            isDense: true,
            border: InputBorder.none),
      ),
    );
  }

  showModalBottomSheetFunc(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF242529),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 5,
                      width: 38,
                      decoration: BoxDecoration(
                          color: AppColors.grey3,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2F3035),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  controller: controllerArrivalTown,
                                  style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    decorationThickness: 0,
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[а-я А-Я 0-9]")),
                                  ],
                                  onTap: () {},
                                  readOnly: false,
                                  decoration: InputDecoration(
                                      prefixIconConstraints:
                                          const BoxConstraints(
                                              minHeight: 24, maxWidth: 28),
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: SvgPicture.asset(
                                            "assets/icons/arrival.svg"),
                                      ),
                                      isDense: true,
                                      border: InputBorder.none),
                                ),
                                const Divider(color: AppColors.grey3),
                                TextFormField(
                                  controller: controllerLandingTown,
                                  style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    decorationThickness: 0,
                                    color: AppColors.grey4,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[а-я А-Я 0-9]")),
                                  ],
                                  readOnly: false,
                                  decoration: InputDecoration(
                                      prefixIconConstraints:
                                          const BoxConstraints(
                                              minHeight: 24, maxWidth: 28),
                                      suffixIconConstraints:
                                          const BoxConstraints(
                                              minHeight: 24, maxWidth: 28),
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: SvgPicture.asset(
                                          "assets/icons/icon-search.svg",
                                          color: Colors.white,
                                        ),
                                      ),
                                      suffixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                controllerLandingTown.clear();
                                              });
                                            },
                                            child: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            )),
                                      ),
                                      isDense: true,
                                      border: InputBorder.none),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                                List.generate(menuTravels.length, (index) {
                              MenuTravel menuTravel = menuTravels[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (index == 0) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DifficultRoute()));
                                    } else if (index == 1) {
                                      controllerLandingTown.text =
                                          menuTravel.name;
                                    } else if (index == 2) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WeekendScreen()));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HotTicketsScreen()));
                                    }
                                  });
                                },
                                child: TravelsCard(menuTravel: menuTravel),
                              );
                            }),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            decoration: BoxDecoration(
                                color: Color(0xFF2F3035),
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: List.generate(
                                  popularDestinations.length, (index) {
                                PopularDestination popularDestination =
                                    popularDestinations[index];
                                return PopularDestinationCard(
                                  popularDestination: popularDestination,
                                  onChanged: (value) {
                                    setState(() {
                                      controllerLandingTown.text = value;
                                      if (controllerLandingTown.text ==
                                          popularDestination.city) {
                                        setState(() {
                                          Future.delayed(
                                              const Duration(
                                                  milliseconds: 1000), () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchCountrySelected(
                                                  arrivalTown:
                                                      controllerArrivalTown
                                                          .text,
                                                  landingTown:
                                                      controllerLandingTown
                                                          .text,
                                                ),
                                              ),
                                            );
                                          });
                                        });
                                      }
                                    });
                                  },
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}

class MenuTravel {
  final String name;
  final String image;

  MenuTravel({required this.name, required this.image});
}

class PopularDestination {
  final String city;
  final String image;

  PopularDestination({required this.city, required this.image});
}
