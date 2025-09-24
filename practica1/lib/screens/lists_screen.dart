import 'package:flutter/material.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  final List<String> _productos = [
    '📱 Smartphone Samsung Galaxy',
    '💻 Laptop Dell Inspiron',
    '🎧 Auriculares Sony',
    '📺 Smart TV LG 55"',
    '⌚ Apple Watch Series 8',
    '🖥️ Monitor Gaming ASUS',
    '📷 Cámara Canon EOS',
    '🎮 PlayStation 5',
    '💾 SSD Kingston 1TB',
    '🖨️ Impresora HP LaserJet',
    '📖 Tablet iPad Air',
    '🔊 Altavoz Bluetooth JBL'
  ];

  void _onItemTap(String item, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Seleccionaste: $item (Posición: $index)'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      appBar: AppBar(
        title: const Text('Listas'),
        backgroundColor: const Color(0xFFFCE4EC),
        foregroundColor: const Color(0xFFC2185B),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Título
                const Text(
                  '📋 Listas (ListView)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC2185B),
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 16),
                
                // Explicación
                Container(
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    '💡 ListView muestra listas eficientemente, reutilizando widgets para mejor rendimiento con grandes cantidades de datos.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF424242),
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Ejemplo interactivo
                const Text(
                  '⚡ Toca cualquier elemento de la lista:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC2185B),
                  ),
                ),
              ],
            ),
          ),
          
          // ListView
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _productos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text(
                        _productos[index],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF424242),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFFC2185B),
                      ),
                      onTap: () => _onItemTap(_productos[index], index),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Información adicional
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              '🔍 Características:\n'
              '• ListView.builder: Construye elementos bajo demanda\n'
              '• Scroll automático cuando hay muchos elementos\n'
              '• Reutilización eficiente de widgets\n'
              '• Ideal para listas largas de datos',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF424242),
              ),
            ),
          ),
        ],
      ),
    );
  }
}