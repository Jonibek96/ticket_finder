import 'offers.dart';

class TicketsOffer {
  final int id;
  final String title;
  final List<String> timeRange;
  final Price price;

  TicketsOffer({required this.id, required this.title, required this.timeRange, required this.price});

  factory TicketsOffer.fromJson(Map<String, dynamic> json) {
    return TicketsOffer(
      id: json['id'],
      title: json['title'],
      timeRange: List<String>.from(json['time_range']),
      price: Price.fromJson(json['price']),
    );
  }
}