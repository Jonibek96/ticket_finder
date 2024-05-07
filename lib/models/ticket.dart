import 'offers.dart';

class Ticket {
  final int id;
  final String badge;
  final Price? price;
  final String providerName;
  final String company;
  final Departure? departure;
  final Arrival? arrival;
  final bool hasTransfer;
  final bool hasVisaTransfer;
  final Luggage? luggage;
  final HandLuggage? handLuggage;
  final bool isReturnable;
  final bool isExchangable;

  Ticket({
    required this.id,
    required this.badge,
    required this.price,
    required this.providerName,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.luggage,
    required this.handLuggage,
    required this.isReturnable,
    required this.isExchangable,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'] ?? 0,
      badge: json['badge'] ?? "",
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
      providerName: json['provider_name'] ?? "",
      company: json['company'] ?? "",
      departure: json['departure'] != null ? Departure.fromJson(json['departure']) : null,
      arrival: json['arrival'] != null ? Arrival.fromJson(json['arrival']) : null,
      hasTransfer: json['has_transfer'] ?? false,
      hasVisaTransfer: json['has_visa_transfer'] ?? false,
      luggage: Luggage.fromJson(json['luggage']),
      handLuggage: HandLuggage.fromJson(json['hand_luggage']),
      isReturnable: json['is_returnable'] ?? false,
      isExchangable: json['is_exchangable'] ?? false,
    );
  }
}

class Departure {
  final String town;
  final String date;
  final String airport;

  Departure({
    required this.town,
    required this.date,
    required this.airport,
  });

  factory Departure.fromJson(Map<String, dynamic> json) {
    return Departure(
      town: json['town'] ?? "",
      date: json['date'] ?? "",
      airport: json['airport'] ?? "",
    );
  }
}

class Arrival {
  final String town;
  final String date;
  final String airport;

  Arrival({
    required this.town,
    required this.date,
    required this.airport,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) {
    return Arrival(
      town: json['town'] ?? "",
      date: json['date'] ?? "",
      airport: json['airport'] ?? "",
    );
  }
}

class Luggage {
  final bool hasLuggage;
  final Price? price;

  Luggage({
    required this.hasLuggage,
    required this.price,
  });

  factory Luggage.fromJson(Map<String, dynamic> json) {
    return Luggage(
      hasLuggage: json['has_luggage'] != null ? json['has_luggage'] : null,
      price: json['price'] != null ? Price.fromJson(json['price']) : null,
    );
  }
}

class HandLuggage {
  final bool hasHandLuggage;
  final String size;

  HandLuggage({
    required this.hasHandLuggage,
    required this.size,
  });

  factory HandLuggage.fromJson(Map<String, dynamic> json) {
    return HandLuggage(
      hasHandLuggage: json['has_hand_luggage'] ?? false,
      size: json['size'] ?? "",
    );
  }
}