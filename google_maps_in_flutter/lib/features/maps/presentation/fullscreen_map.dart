import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bloc/location_bloc.dart';
import 'bloc/location_event.dart';
import 'bloc/location_state.dart';

class FullScreenMap extends StatefulWidget {
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.ubicacionStatus == MapRequest.requestInProgress) {
            // Esta parte se ejecutará después de un retraso de 1 segundo
            return const CircularProgressIndicator();
          }
          if (state.ubicacionStatus == MapRequest.requestFailure) {
            // Esta parte se ejecutará después de un retraso de 1 segundo
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Problem loading products'),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      context.read<LocationBloc>().add(RequestLocationEvent());
                    },
                    child: const Text('Try again'),
                  ),
                ],
              ),
            );

          }
          if (state.ubicacionStatus == MapRequest.unknown) {
            // Esta parte se ejecutará después de un retraso de 1 segundo
            context.read<LocationBloc>().add(RequestLocationEvent());
          }
          if (state.ubicacionStatus == MapRequest.requestSuccess) {
            // Esta parte se ejecutará después de un retraso de 1 segundo
            final latitud = state.ubicacion[0]['latitude'];
            final longitud = state.ubicacion[0]['longitud'];
            LatLng currentLocation = LatLng(latitud, longitud);
            Set<Marker> markers = {};
            markers.add( 
              Marker(
                markerId: MarkerId('currentLocationMarker'),
                position: currentLocation,
              ),
            );

            print(latitud);
            print(longitud);
            return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation ?? LatLng(0.0, 0.0), // Ubicación predeterminada si no está disponible
              zoom: 11.0,
            ),
            markers: markers,
            onMapCreated: (GoogleMapController controller) {},
          );

          }

          return Text("data");
        }    
      ),
    );
  }
}