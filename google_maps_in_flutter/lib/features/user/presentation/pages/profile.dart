import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../pdf/presentation/post_pdf.dart';
import '../bloc/bloc_login/user_bloc.dart';
import '../bloc/bloc_login/user_event.dart';
import '../bloc/bloc_login/user_state.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void cerrarSesion() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            // Lógica para manejar el botón de retroceso aquí
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Text(
                'My App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.black,
              onPressed: () {
                context.read<UserBloc>().add(RemoveAuthToken());
                context.read<UserBloc>().add(GetAuthToken());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.userStatus == UserRequest.requestInProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.userStatus == UserRequest.requestFailure) {
              // return const LoginView();
            }
            if (state.userStatus == UserRequest.unknown) {
              context.read<UserBloc>().add(GetAuthToken());
            }
            return Center(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        ElevatedButton(
                          onPressed: () {
                            // loginUser();
                            // _enviarFormulario();
                            // print("estoy en login${state.userStatus}");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 93, 93, 93),
                            ),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: Container(
                            width: 200.0,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: const Center(
                              child: Text(
                                'Obtener mi ubicacion',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
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

        pageBuilder: (_, __, ___) => const PostPdf(),
      ),
    );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 93, 93, 93),
                            ),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: Container(
                            width: 200.0,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: const Center(
                              child: Text(
                                'Subir pdf',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                        
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 93, 93, 93),
                            ),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: Container(
                            width: 200.0,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: const Center(
                              child: Text(
                                'Leer pdf',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  // const MiBussines(),
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      //  const Icon(Icons.add, color: Colors.black),
    );
  }
}
