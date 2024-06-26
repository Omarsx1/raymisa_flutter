import 'package:flutter/material.dart';
import 'package:raymisa/views/Muestra.dart';
import 'package:raymisa/menu/Configuracion.dart';
import 'package:raymisa/menu/Inicio.dart';
import 'package:raymisa/menu/Dashboard.dart';
import 'package:raymisa/menu/InventoryPage.dart';
import 'package:raymisa/views/Orden.dart';
import 'package:raymisa/views/Reporte.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Inicio(),
    const InventoryPage(),
    const SizedBox.shrink(), // Placeholder for the SpeedDial options
    const Dashboard(),
    const Configuracion(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _showOptionsModal(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showOptionsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Generar Orden'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Orden()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Añadir Muestra'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Muestra()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_chart),
              title: const Text('Generar Reporte'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Reporte()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BarraNavegacionPersonalizada(
        indiceSeleccionado: _selectedIndex,
        alSeleccionarItem: _onItemTapped,
      ),
    );
  }
}

class BarraNavegacionPersonalizada extends StatelessWidget {
  final int indiceSeleccionado;
  final Function(int) alSeleccionarItem;

  const BarraNavegacionPersonalizada({super.key, required this.indiceSeleccionado, required this.alSeleccionarItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _construirItemNav(Icons.home, 0),
          _construirItemNav(Icons.inventory_2, 1),
          _construirItemNav(Icons.add, 2),
          _construirItemNav(Icons.insert_chart, 3),
          _construirItemNav(Icons.person_outline, 4),
        ],
      ),
    );
  }

  Widget _construirItemNav(IconData icono, int indice) {
    return GestureDetector(
      onTap: () => alSeleccionarItem(indice),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: indiceSeleccionado == indice ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icono,
          color: indiceSeleccionado == indice ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
