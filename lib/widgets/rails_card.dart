import 'package:flutter/material.dart';

import '../models/tickets_offers.dart';
import '../utils/app_colors.dart';
import '../utils/util.dart';

class RailsCard extends StatelessWidget {
  final TicketsOffer ticketsOffer;
  final Color colorIcon;
  const RailsCard({super.key, required this.ticketsOffer, required this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.grey3))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    color: colorIcon,
                    shape: BoxShape.circle
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ticketsOffer.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${numberFormatDecimal(ticketsOffer.price.value)} ₽ ',
                              style: const TextStyle(
                                  color: AppColors.blueSpecial,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right, color: AppColors.blueSpecial,)
                          ],
                        ),
                      ],
                    ),
                    Text(
                      ticketsOffer.timeRange.join(" "),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
