import 'package:flutter/material.dart';


import '../../models/offers.dart';

@immutable
sealed class OfferState {}

final class OfferInitial extends OfferState {}

final class OfferLoading extends OfferState {}

final class OfferLoaded extends OfferState {
  final List<Offer> offers;

  OfferLoaded({this.offers = const []});
}

final class OfferError extends OfferState {
  final String error;
  OfferError(this.error);
}