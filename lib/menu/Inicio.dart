import 'package:flutter/material.dart';
import 'package:raymisa/views/Orden.dart';
import 'package:raymisa/views/Muestra.dart';
import 'package:raymisa/views/Reporte.dart'; // Importa la nueva pantalla de reporte
import 'package:raymisa/menu/Configuracion.dart'; // Importa la nueva pantalla de configuración de perfil

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        centerTitle: true, // Centrar el título
        automaticallyImplyLeading: false, // Elimina la flecha de retroceso
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Configuracion()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orden()),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Generar Orden'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Muestra()),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Añadir Muestra'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reporte()),
                );
              },
              icon: Icon(Icons.insert_chart),
              label: Text('Generar Reporte'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
