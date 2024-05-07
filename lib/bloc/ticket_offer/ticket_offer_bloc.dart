import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_finder/bloc/ticket_offer/ticket_offer_event.dart';
import 'package:ticket_finder/bloc/ticket_offer/ticket_offer_state.dart';

import '../../services/api_service.dart';

class TicketOfferBloc extends Bloc<TicketOfferEvent, TicketOfferState> {
  final ApiService apiService;
  TicketOfferBloc({required this.apiService}) : super(TicketOfferInitial()) {
    on<TicketOfferEvent>((event, emit) async {
      emit(TicketOfferLoading());
      try {
        final result = await apiService.getTicketOffers();
        emit(TicketOfferLoaded(ticketsOffers: result));
      }catch (error){
        emit(TicketOfferError(error.toString()));
      }
    });
  }
}