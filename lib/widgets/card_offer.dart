import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/offers.dart';
import '../utils/util.dart';

class CardOffer extends StatefulWidget {
  final List<Offer> offers;
  final int index;
  const CardOffer({super.key, required this.offers, required this.index});

  @override
  State<CardOffer> createState() => _CardOfferState();
}

class _CardOfferState extends State<CardOffer> {
  @override
  Widget build(BuildContext context) {
    final Offer offer = widget.offers[widget.index];

    return Container(
      margin: EdgeInsets.only(right: widget.index == widget.offers.length - 1 ? 0 : 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 133,
            width: 132,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16)
            ),
            child: Image.asset("assets/images/offer-img${widget.index + 1}.png"),
          ),
          const SizedBox(height: 8),
          Text(
            offer.title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16
            ),
          ),
          const SizedBox(height: 8),
          Text(
            offer.town,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset("assets/icons/air.svg"),
              Text(
                'от ${numberFormatDecimal(offer.price.value)} ₽',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
