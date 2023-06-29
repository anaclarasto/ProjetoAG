import 'package:flutter/material.dart';
import 'package:projeto_glicemia/tela_checkup.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nível de Glicose',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Hind',
              ))
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glicoseController = TextEditingController();
  String _resultText = '';

  void _calculaNivelGlicose() {
    double nivelGlicose = double.tryParse(_glicoseController.text) ?? 0;

    if (nivelGlicose < 70) {
      _resultText = 'Hipoglicemia';
    } else if (nivelGlicose > 126) {
      _resultText = 'Hiperglicemia';
    } else {
      _resultText = 'Glicemia normalizada';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nível de Glicose'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                'assets/images/glicoseIcon.png',
                height: 120,
              ),
            ), 
            const SizedBox(height: 114.0),
            TextField(
              controller: _glicoseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o nível de glicose',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculaNivelGlicose,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _resultText,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 70.0),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCheckup()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
