import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_in_flutter/features/maps/presentation/fullscreen_map.dart';

import 'bloc/location_bloc.dart';
import 'bloc/location_event.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                myLocation();
              },
              child: const Text("obtener mi ubicacion"))
        ],
      ),
    )
    );
  }

  void myLocation() {
    context.read<LocationBloc>().add(RequestLocationEvent());
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween(
              begin:
                  const Offset(1, 0), // Cambia aquí para iniciar desde arriba
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        // ... Otros parámetros de PageRouteBuilder);

        pageBuilder: (_,__,___) => const FullScreenMap(),
      ),
    );
  }
}
