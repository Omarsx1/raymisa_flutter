import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:raymisa/conexion/database_service.dart'; // Importa tu servicio de Firestore
import 'package:raymisa/widgets/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Carga la página de login
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseService _databaseService;
  String _connectionStatus = '';

  @override
  void initState() {
    super.initState();
    _databaseService = DatabaseService();
    _connectToFirestore();
  }

  Future<void> _connectToFirestore() async {
    final isConnected = await _databaseService.connect();
    setState(() {
      _connectionStatus = isConnected ? 'Conexión a Firestore exitosa' : 'Error al conectar a Firestore';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Firebase Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _connectionStatus,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _connectToFirestore();
              },
              child: Text('Reintentar conexión'),
            ),
          ],
        ),
      ),
    );
  }
}
