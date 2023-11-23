import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/maps/presentation/bloc/location_bloc.dart';
// import 'features/maps/presentation/mapScreen.dart';
import 'features/user/presentation/bloc/bloc_login/user_bloc.dart';
import 'features/user/presentation/pages/login_view.dart';

import 'features/user/presentation/pages/profile.dart';
import 'get_location_usecage_config.dart';
import 'login_usecase_config.dart';

UsecaseMapsConfig usecaseMapsConfig = UsecaseMapsConfig();
UseCaseUserConfig useCaseUserConfig = UseCaseUserConfig();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// 
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LocationBloc(usecaseMapsConfig.getLocationUsecase!)),
        BlocProvider(create: (BuildContext context) => UserBloc(useCaseUserConfig.loginUserUsecase!, useCaseUserConfig.getAuthTokenUseCase!, useCaseUserConfig.removeTokenUseCase!)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const Profile(),
      ),
    );
  }
}
