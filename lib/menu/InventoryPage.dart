import 'package:flutter/material.dart';
import 'package:raymisa/views/Reporte.dart'; // Asegúrate de que esta ruta sea correcta
import 'package:raymisa/views/MateriaPrima.dart'; // Asegúrate de que esta ruta sea correcta

class InventoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              title: Text('Procesos'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reporte()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Materia Prima'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MateriaPrimaPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
