import 'package:flutter/material.dart';
import 'package:raymisa/widgets/Login.dart';

class ConnectionStatusPage extends StatelessWidget {
  final bool isConnected;

  const ConnectionStatusPage({required this.isConnected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connection Status'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isConnected ? 'Conexión establecida correctamente' : 'No se pudo establecer la conexión',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Volver al inicio de sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
