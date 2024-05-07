import 'package:flutter/material.dart';
import 'package:ticket_finder/models/tickets_offers.dart';


@immutable
class TicketOfferState {}

final class TicketOfferInitial extends TicketOfferState {}

final class TicketOfferLoading extends TicketOfferState {}

final class TicketOfferLoaded extends TicketOfferState {
  final List<TicketsOffer> ticketsOffers;

  TicketOfferLoaded({this.ticketsOffers = const []});
}

final class TicketOfferError extends TicketOfferState {
  final String error;
  TicketOfferError(this.error);
}