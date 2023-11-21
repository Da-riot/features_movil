import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/maps/presentation/bloc/location_bloc.dart';
import 'features/maps/presentation/mapScreen.dart';
import 'get_location_usecage_config.dart';

UsecaseMapsConfig usecaseMapsConfig = UsecaseMapsConfig();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LocationBloc(usecaseMapsConfig.getLocationUsecase!)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MapScreen(),
      ),
    );
  }
}
