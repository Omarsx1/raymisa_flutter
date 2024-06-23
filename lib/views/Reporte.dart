import 'package:flutter/material.dart';

class Reporte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ejemplo de datos de reportes con costos por tipo de prenda
    List<Map<String, dynamic>> reportes = [
      {
        'titulo': 'Reporte 1',
        'descripcion': 'Descripción del reporte 1',
        'detalles': {
          'Camisa': 120.0,
          'Pantalón': 200.0,
          'Chaqueta': 250.0,
          'Falda': 150.0,
        },
      },
      {
        'titulo': 'Reporte 2',
        'descripcion': 'Descripción del reporte 2',
        'detalles': {
          'Camisa': 100.0,
          'Pantalón': 220.0,
          'Chaqueta': 240.0,
          'Falda': 130.0,
        },
      },
      // Agrega más reportes aquí
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Generar Reporte'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reportes Generados',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: reportes.length,
                itemBuilder: (context, index) {
                  var reporte = reportes[index];
                  return Card(
                    elevation: 3.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(Icons.insert_drive_file),
                      title: Text(reporte['titulo']),
                      subtitle: Text(reporte['descripcion']),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleReporte(
                              reporte: reporte['titulo'],
                              detalles: reporte['detalles'],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Lógica para generar un nuevo reporte
                },
                icon: Icon(Icons.add),
                label: Text('Generar Nuevo Reporte'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetalleReporte extends StatelessWidget {
  final String reporte;
  final Map<String, double> detalles;

  DetalleReporte({required this.reporte, required this.detalles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reporte),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalles de $reporte',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: detalles.entries.map((entry) {
                  return ListTile(
                    title: Text(entry.key),
                    trailing: Text('\$${entry.value.toStringAsFixed(2)}'),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                label: Text('Regresar'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
