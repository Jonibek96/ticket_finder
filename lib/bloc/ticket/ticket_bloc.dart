import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_finder/bloc/ticket/ticket_event.dart';
import 'package:ticket_finder/bloc/ticket/ticket_state.dart';

import '../../services/api_service.dart';


class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final ApiService apiService;
  TicketBloc({required this.apiService}) : super(TicketInitial()) {
    on<TicketEvent>((event, emit) async {
      emit(TicketLoading());
      try {
        final result = await apiService.getTickets();
        emit(TicketLoaded(tickets: result));
      }catch (error){
        emit(TicketError(error.toString()));
      }
    });
  }
}