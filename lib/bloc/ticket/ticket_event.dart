import 'package:flutter/material.dart';

@immutable
sealed class TicketEvent {}

class LoadTicket extends TicketEvent {}