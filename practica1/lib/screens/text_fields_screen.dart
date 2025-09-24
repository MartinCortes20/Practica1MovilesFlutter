import 'package:flutter/material.dart';

class TextFieldsScreen extends StatefulWidget {
  const TextFieldsScreen({super.key});

  @override
  State<TextFieldsScreen> createState() => _TextFieldsScreenState();
}

class _TextFieldsScreenState extends State<TextFieldsScreen> {
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _resultado = 'Los datos aparecerán aquí...';

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _mostrarDatos() {
    final nombre = _nombreController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    if (nombre.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      setState(() {
        _resultado = 'Nombre: $nombre\n'
            'Email: $email\n'
            'Password: ${'*' * password.length}';
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Datos capturados correctamente'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor llena todos los campos'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: const Text('TextFields (TextField)'),
        backgroundColor: const Color(0xFFE3F2FD),
        foregroundColor: const Color(0xFF1976D2),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            const Center(
              child: Text(
                '📝 TextFields (TextField)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Explicación
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                '💡 Los TextField permiten al usuario ingresar y editar texto. Son fundamentales para formularios y captura de datos.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Ejemplos interactivos
            const Text(
              '⚡ Prueba los diferentes tipos:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Campo de texto normal
            const Text(
              'Texto normal:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu nombre',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Campo de email
            const Text(
              'Email:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'ejemplo@correo.com',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Campo de contraseña
            const Text(
              'Contraseña:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Ingresa tu contraseña',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Botón para mostrar datos
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _mostrarDatos,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Mostrar Datos Capturados',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Área de resultado
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                _resultado,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF424242),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}