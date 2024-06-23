import 'package:flutter/material.dart';

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            subtitle: Text('Editar perfil'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacidad'),
            subtitle: Text('Configuración de privacidad'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacidadPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificaciones'),
            subtitle: Text('Configuración de notificaciones'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificacionesPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Idioma'),
            subtitle: Text('Seleccionar idioma'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IdiomaPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre la app'),
            subtitle: Text('Información sobre la aplicación'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SobreAppPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Ejemplo de las páginas individuales de configuración:

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para guardar la información del perfil
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacidadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacidad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text('Perfil privado'),
              value: true,
              onChanged: (bool value) {
                // Lógica para cambiar la configuración de privacidad
              },
            ),
            SwitchListTile(
              title: Text('Compartir ubicación'),
              value: false,
              onChanged: (bool value) {
                // Lógica para cambiar la configuración de privacidad
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text('Notificaciones push'),
              value: true,
              onChanged: (bool value) {
                // Lógica para cambiar la configuración de notificaciones
              },
            ),
            SwitchListTile(
              title: Text('Notificaciones por correo'),
              value: false,
              onChanged: (bool value) {
                // Lógica para cambiar la configuración de notificaciones
              },
            ),
          ],
        ),
      ),
    );
  }
}

class IdiomaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Idioma'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Español'),
              trailing: Icon(Icons.check),
              onTap: () {
                // Lógica para seleccionar el idioma español
              },
            ),
            ListTile(
              title: Text('Inglés'),
              trailing: Icon(null),
              onTap: () {
                // Lógica para seleccionar el idioma inglés
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SobreAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre la app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Versión 1.0.0',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Esta es una aplicación para la gestión de procesos y muestras de indumentaria.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
