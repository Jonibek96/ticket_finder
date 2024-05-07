
import 'package:flutter/material.dart';

@immutable
sealed class OfferEvent {}

class LoadOffer extends OfferEvent {}