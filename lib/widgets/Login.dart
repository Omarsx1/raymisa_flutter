import 'package:firebase_auth/firebase_auth.dart'; // Importa Firebase Auth
import 'package:flutter/material.dart';
import 'package:raymisa/conexion/database_service.dart';
import 'package:raymisa/menu/Inicio.dart'; // Importa la página de inicio

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _connectionStatus = ''; // Variable para almacenar el estado de la conexión

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  void _checkConnection() async {
    final isConnected = await DatabaseService().connect();
    setState(() {
      _connectionStatus = isConnected ? 'Conexión a Firestore exitosa' : 'Error al conectar a Firestore';
    });
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final isConnected = await DatabaseService().connect();
      setState(() {
        _connectionStatus = isConnected ? 'Conectado correctamente' : 'No se pudo conectar';
      });
      if (isConnected) {
        try {
          // 1. Autenticación con Firebase Authentication
          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
          // 2. Si la autenticación es exitosa, navega a la siguiente pantalla
          if (userCredential.user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Inicio()),
            );
          }
        } on FirebaseAuthException catch (e) {
          // 3. Manejo de errores de autenticación
          String errorMessage = 'Error desconocido';
          if (e.code == 'user-not-found') {
            errorMessage = 'Usuario no encontrado';
          } else if (e.code == 'wrong-password') {
            errorMessage = 'Contraseña incorrecta';
          }

          // Muestra el mensaje de error (puedes usar un SnackBar, un Dialog, etc.)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30), // Espacio desde arriba
              // Agrega la imagen aquí
              Image.asset(
                'assets/images/logo.png',
                height: 200, // Aumenta la altura de la imagen
                width: 200,  // Opcionalmente ajusta el ancho de la imagen
              ),
              SizedBox(height: 20), // Espacio debajo de la imagen
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _connectionStatus,
                      style: TextStyle(
                        color: _connectionStatus.contains('correctamente') ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
