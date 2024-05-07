import 'package:flutter/material.dart';


import '../../models/ticket.dart';

@immutable
sealed class TicketState {}

final class TicketInitial extends TicketState {}

final class TicketLoading extends TicketState {}

final class TicketLoaded extends TicketState {
  final List<Ticket> tickets;

  TicketLoaded({this.tickets = const []});
}

final class TicketError extends TicketState {
  final String error;
  TicketError(this.error);
}