import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_finder/utils/app_colors.dart';

import '../../bloc/ticket/ticket_bloc.dart';
import '../../bloc/ticket/ticket_event.dart';
import '../../bloc/ticket/ticket_state.dart';
import '../../models/ticket.dart';
import '../../services/api_service.dart';
import '../../widgets/card_ticket.dart';

class TicketListScreen extends StatefulWidget {
  final String arrivalTown;
  final String landingTown;
  final String dataArrival;
  final int countPassenger;

  const TicketListScreen(
      {super.key,
      required this.arrivalTown,
      required this.landingTown,
      required this.dataArrival,
      required this.countPassenger});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            TicketBloc(apiService: ApiService())..add(LoadTicket()),
        child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(height: 34),
                  BlocBuilder<TicketBloc, TicketState>(
                      builder: (context, state) {
                    if (state is TicketLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ));
                    } else if (state is TicketLoaded) {
                      final tickets = state.tickets;
                      return Column(
                        children: List.generate(tickets.length, (index) {
                          Ticket ticket = tickets[index];
                          return CardTicket(ticket: ticket);
                        }),
                      );
                    } else if (state is TicketError) {
                      return Text(
                        state.error,
                        style: TextStyle(color: Colors.white),
                      );
                    }
                    ;
                    return const SizedBox();
                  }),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                    color: AppColors.blueSpecial,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icons/filter.png"),
                        const Text(
                          "Фильтр",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Image.asset("assets/icons/leadboard.png"),
                        const Text(
                          "График цен",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF242529),
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: AppColors.blueSpecial),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.arrivalTown}-${widget.landingTown}',
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '${widget.dataArrival} ${widget.countPassenger} пассажир',
            style: const TextStyle(
                color: AppColors.grey4,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
