// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

// import '../bloc/bloc_login/user_bloc.dart';
// import '../bloc/bloc_login/user_state.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: BlocBuilder<UserBloc, UserState>(
//         builder: (context, state) {
//         return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Usuario',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Contraseña',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 24.0),
//                 ElevatedButton(
//                   onPressed: () {
//                       validate();
//                   },
//                   child: Text('Iniciar sesión'),
//                 ),
//               ],
//             ));
//       }),
//     );
//   }

//   void validate(){
//     print("ejecutado");
//   }
// }
