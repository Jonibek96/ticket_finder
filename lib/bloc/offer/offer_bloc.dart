import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/api_service.dart';
import 'offer_event.dart';
import 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final ApiService apiService;
  OfferBloc({required this.apiService}) : super(OfferInitial()) {
    on<OfferEvent>((event, emit) async {
      emit(OfferLoading());
      try {
        final result = await apiService.getOffers();
        emit(OfferLoaded(offers: result));
      }catch (error){
        emit(OfferError(error.toString()));
      }
    });
  }
}