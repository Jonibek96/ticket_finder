import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ticket_finder/models/tickets_offers.dart';

import '../models/offers.dart';
import '../models/ticket.dart';

class ApiService {

   Future<List<Ticket>> getTickets() async {
     Dio dio = Dio();
     var headers = {'Content-Type': 'application/json'};
     var response = await dio.request(
        'https://run.mocky.io/v3/2dbc0999-86bf-4c08-8671-bac4b7a5f7eb',
         options: Options(
           method: 'GET',
           headers: headers,
         ),
         data: {}
     );
      if (response.statusCode == 200) {
        var data = json.encode(response.data);
        final List res = json.decode(data)['tickets'];
        return res.map(((e) => Ticket.fromJson(e))).toList();
      } else {
        throw Exception('Failed to load tickets');
      }
  }

   Future<List<Offer>> getOffers() async {
      Dio dio = Dio();
      var headers = {'Content-Type': 'application/json'};
      var response = await dio.request(
          'https://run.mocky.io/v3/00727197-24ae-48a0-bcb3-63eb35d7a9de',
          options: Options(
            method: 'GET',
            headers: headers,
          ),
          data: {}
      );
      if (response.statusCode == 200) {
        var data = json.encode(response.data);
        final List res = json.decode(data)['offers'];
        return res.map(((e) => Offer.fromJson(e))).toList();
      } else {
        throw Exception('Failed to load offers');
      }
  }

   Future<List<TicketsOffer>> getTicketOffers() async {
     Dio dio = Dio();
     var headers = {'Content-Type': 'application/json'};
     var response = await dio.request(
         'https://run.mocky.io/v3/3424132d-a51a-4613-b6c9-42b2d214f35f',
         options: Options(
           method: 'GET',
           headers: headers,
         ),
         data: {}
     );
     if (response.statusCode == 200) {
       var data = json.encode(response.data);
       final List res = json.decode(data)['tickets_offers'];
       return res.map(((e) => TicketsOffer.fromJson(e))).toList();
     } else {
       throw Exception('Failed to load tickets offers');
     }
   }
}