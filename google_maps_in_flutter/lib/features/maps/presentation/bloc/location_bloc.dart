import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../domain/usecase/get_location_usecase.dart';
import './location_event.dart';
import './location_state.dart';
// import 'package:google_maps_in_flutter/domain/locationRepository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUsecase getLocationUsecase;

  LocationBloc(this.getLocationUsecase) : super(const LocationState()) {
    on<RequestLocationEvent>(_mapRequestLocationToState);
  }

  Future<void> _mapRequestLocationToState(
      event, Emitter<LocationState> emit) async {
    print("Se ejecuto el bloc");
    try {
      emit(state.copyWith(ubicacionStatus: MapRequest.requestInProgress));
      final response = await getLocationUsecase.execute();
      print("Se ejecuto el execute: ${response}");
      emit(
        state.copyWith(
          ubicacionStatus: MapRequest.requestSuccess,
          ubicacion: response,
        ),
      );
    } catch (e) {
      print('Error during login: $e');

      emit(state.copyWith(
        ubicacionStatus: MapRequest.requestFailure,
      ));
    }
  }
}
