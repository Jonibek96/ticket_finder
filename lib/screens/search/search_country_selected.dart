import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ticket_finder/bloc/ticket_offer/ticket_offer_event.dart';
import 'package:ticket_finder/screens/search/ticket_list_screen.dart';

import '../../bloc/ticket_offer/ticket_offer_bloc.dart';
import '../../bloc/ticket_offer/ticket_offer_state.dart';
import '../../services/api_service.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/rails_card.dart';
import '../../widgets/switch_button.dart';
import 'filter_screen.dart';

class SearchCountrySelected extends StatefulWidget {
  final String arrivalTown;
  final String landingTown;

  const SearchCountrySelected(
      {super.key, required this.arrivalTown, required this.landingTown});

  @override
  State<SearchCountrySelected> createState() => _SearchCountrySelectedState();
}

class _SearchCountrySelectedState extends State<SearchCountrySelected> {
  bool _switchValue = false;

  String dateNowInitial = "";
  String weekNowInitial = "";

  List<Color> listColorRailsIcon = [
    AppColors.red,
    AppColors.blueSpecial,
    Colors.white
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      locale: const Locale('ru', 'RU'),
    );

    if (picked != null) {
      setState(() {
        dateNowInitial = DateFormat('dd MMM,', 'ru').format(picked);
        weekNowInitial = DateFormat('E', 'ru').format(picked);
      });
    }
  }

  @override
  void initState() {
    dateNowInitial = DateFormat('dd MMM,', 'ru').format(DateTime.now());
    weekNowInitial = DateFormat('E', 'ru').format(DateTime.now());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TicketOfferBloc(apiService: ApiService())..add(LoadTicketOffer()),
      child: Scaffold(
          backgroundColor: AppColors.black,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F3035),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white)),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.arrivalTown,
                                    style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      decorationThickness: 0,
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SvgPicture.asset("assets/icons/down_up.svg")
                                ],
                              ),
                              const Divider(color: AppColors.grey3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.landingTown,
                                    style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      decorationThickness: 0,
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 13),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectDate(context);
                              });
                            },
                            child: buildContainer(
                                const Icon(Icons.add, color: Colors.white),
                                const Text(
                                  "обратно",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectDate(context);
                              });
                            },
                            child: buildContainer(
                                Text(
                                  dateNowInitial,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  weekNowInitial,
                                  style: TextStyle(
                                      color: AppColors.grey4,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                          const SizedBox(width: 10),
                          buildContainer(
                            SvgPicture.asset(
                              "assets/icons/person.svg",
                              width: 16,
                              height: 16,
                            ),
                            const Text(
                              "1, эконом",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FilterScreen()));
                              });
                            },
                            child: buildContainer(
                              Image.asset(
                                "assets/icons/filter.png",
                                width: 16,
                                height: 16,
                              ),
                              const Text(
                                "фильтер",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 13),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: const Color(0xFF1D1E20),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Прямые рельсы',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<TicketOfferBloc, TicketOfferState>(
                            builder: (context, state) {
                          if (state is TicketOfferLoading) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            ));
                          } else if (state is TicketOfferLoaded) {
                            final ticketOffers = state.ticketsOffers;
                            return Column(
                              children: List.generate(3, (index) {
                                return RailsCard(
                                    ticketsOffer: ticketOffers[index],
                                    colorIcon: listColorRailsIcon[index]);
                              }),
                            );
                          } else if (state is TicketOfferError) {
                            return Text(
                              state.error,
                              style: const TextStyle(color: Colors.white),
                            );
                          }
                          return const SizedBox();
                        }),
                        AppButton(
                          name: "Показать все",
                          bgColor: Colors.transparent,
                          textColor: AppColors.blueSpecial,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    name: "Посмотреть все билеты",
                    bgColor: AppColors.blueSpecial,
                    textColor: Colors.white,
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TicketListScreen(
                                    arrivalTown: widget.arrivalTown,
                                    landingTown: widget.landingTown,
                                    dataArrival: dateNowInitial,
                                    countPassenger: 1)));
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 13),
                    decoration: BoxDecoration(
                      color: Color(0xFF242529),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/subs.svg",
                              color: AppColors.blueSpecial,
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              "Подписка на цену",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SwitchButton(
                          switchValue: _switchValue,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Container buildContainer(Widget widget1, widget2) {
    return Container(
      height: 33,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Color(0XFF2F3035), borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget1,
          const SizedBox(
            width: 8,
          ),
          widget2
        ],
      ),
    );
  }
}
