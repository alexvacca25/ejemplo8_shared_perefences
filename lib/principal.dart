import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  var usuarior = '';
  var estado = '';
  var rol = '';
  @override
  void initState() {
    super.initState();
    consultarusuario();
  }

  consultarusuario() async {
    Future<SharedPreferences> _localuser = SharedPreferences.getInstance();
    final SharedPreferences localuser = await _localuser;
    usuarior = localuser.getString('usuario')!;
    estado = localuser.getString('estado')!;
    rol = localuser.getString('rol')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(usuarior), Text(estado), Text(rol)],
        ),
      ),
    );
  }
}
