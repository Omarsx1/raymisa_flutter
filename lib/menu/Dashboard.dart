import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SectionHeader(title: 'Colecciones'),
            buildSection(context, [
              DashboardCard(
                icon: Icons.collections,
                title: 'Colecciones',
                value: '5', // Ejemplo
                color: Colors.blue,
              ),
            ]),
            SectionHeader(title: 'Costo por Prenda'),
            buildSection(context, [
              DashboardCard(
                icon: Icons.attach_money,
                title: 'Pantalón',
                value: '\$20.00', // Ejemplo
                color: Colors.green,
              ),
              DashboardCard(
                icon: Icons.attach_money,
                title: 'Guantes',
                value: '\$5.00', // Ejemplo
                color: Colors.orange,
              ),
              DashboardCard(
                icon: Icons.attach_money,
                title: 'Chompas',
                value: '\$25.00', // Ejemplo
                color: Colors.purple,
              ),
              DashboardCard(
                icon: Icons.attach_money,
                title: 'Chalinas',
                value: '\$15.00', // Ejemplo
                color: Colors.red,
              ),
            ]),
            SectionHeader(title: 'Tiempo por Prenda'),
            buildSection(context, [
              DashboardCard(
                icon: Icons.timer,
                title: 'Pantalón',
                value: '30 min', // Ejemplo
                color: Colors.teal,
              ),
              DashboardCard(
                icon: Icons.timer,
                title: 'Guantes',
                value: '15 min', // Ejemplo
                color: Colors.brown,
              ),
              DashboardCard(
                icon: Icons.timer,
                title: 'Chompas',
                value: '45 min', // Ejemplo
                color: Colors.amber,
              ),
              DashboardCard(
                icon: Icons.timer,
                title: 'Chalinas',
                value: '20 min', // Ejemplo
                color: Colors.indigo,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSection(BuildContext context, List<DashboardCard> cards) {
    if (cards.length > 2) {
      return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: cards,
      );
    } else {
      return Column(
        children: cards,
      );
    }
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  DashboardCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 48, color: color),
            SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
