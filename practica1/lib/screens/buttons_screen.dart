import 'package:flutter/material.dart';
import 'detail_screens.dart';


class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('IconButton presionado $_contador veces'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E8),
      appBar: AppBar(
        title: const Text('Botones'),
        backgroundColor: const Color(0xFFE8F5E8),
        foregroundColor: const Color(0xFF388E3C),
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
                '🎨 Botones (Button, IconButton)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF388E3C),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Explicación
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                '💡 Los botones son elementos interactivos que ejecutan acciones cuando el usuario los toca. Pueden contener texto o iconos.',
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
                color: Color(0xFF388E3C),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // ElevatedButton normal
            const Text(
              'ElevatedButton normal:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡ElevatedButton presionado!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Presiona aquí'),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // OutlinedButton
            const Text(
              'OutlinedButton:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡OutlinedButton presionado!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Botón Secundario'),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // TextButton
            const Text(
              'TextButton:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡TextButton presionado!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Botón de Texto'),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // IconButton con contador
            const Text(
              'IconButton (con contador):',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: _incrementarContador,
                  icon: const Icon(Icons.add_circle),
                  iconSize: 56,
                  color: const Color(0xFF388E3C),
                ),
                const SizedBox(width: 16),
                Text(
                  'Contador: $_contador',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF424242),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // FloatingActionButton
            const Text(
              'FloatingActionButton:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Center(
              child: FloatingActionButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡FloatingActionButton presionado!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                backgroundColor: const Color(0xFF388E3C),
                child: const Icon(Icons.favorite, color: Colors.white),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Información adicional
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '🔍 Características:\n'
                '• ElevatedButton: Botón elevado con sombra\n'
                '• OutlinedButton: Botón con borde\n'
                '• TextButton: Botón solo con texto\n'
                '• IconButton: Botón con icono\n'
                '• FloatingActionButton: Botón flotante circular',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF424242),
                ),
              ),
            ),     // Botón para abrir Detail Screen
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ButtonsDetailScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF1976D2),
                      ),
                      child: const Text(
                        'ABRIR LA OTRA SCREEN',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}