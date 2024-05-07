import 'package:flutter/material.dart';

import '../models/ticket.dart';
import '../utils/app_colors.dart';
import '../utils/util.dart';

class CardTicket extends StatelessWidget {
  final Ticket ticket;

  const CardTicket({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 117,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                color: const Color(0xFF1D1E20),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${numberFormatDecimal(ticket.price!.value)} ₽',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${extractTime(ticket.departure!.date)} - ${extractTime(ticket.arrival!.date)}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${ticket.departure!.airport}  ${ticket.arrival!.airport}",
                                style: const TextStyle(
                                    color: AppColors.grey4,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "${calculateTimeDifference(ticket.departure!.date, ticket.arrival!.date)}ч в пути${ticket.hasTransfer ? '/Без пересадок' : ""}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          ticket.badge.isNotEmpty
              ? Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                        color: AppColors.blueSpecial,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      ticket.badge,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
