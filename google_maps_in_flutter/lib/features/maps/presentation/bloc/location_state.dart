

enum MapRequest {
  unknown,
  requestInProgress,
  requestSuccess,
  requestFailure,
}

class LocationState {
  const LocationState({
    this.ubicacion = const [],
    this.ubicacionStatus = MapRequest.unknown,
    // this.token = const {},
  });

  final List ubicacion;
  final MapRequest ubicacionStatus;
  // final Set<String> token;

  LocationState copyWith({
    List? ubicacion,
    LocationState? ubicacionState,
    // Set<String>? token,
    required ubicacionStatus,
  }) =>
      LocationState(
        ubicacion: ubicacion ?? this.ubicacion,
        ubicacionStatus: ubicacionStatus ?? this.ubicacionStatus,
      );
}
