import 'package:flutter/material.dart';
import 'detail_screens.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  // Checkboxes
  bool _deportes = false;
  bool _musica = false;
  bool _tecnologia = false;

  // Radio buttons
  String? _nivel;

  // Switch
  bool _notificaciones = false;

  String _resultado = 'Haz tus selecciones y presiona el botón...';

  void _mostrarSelecciones() {
    List<String> intereses = [];
    
    if (_deportes) intereses.add('Deportes');
    if (_musica) intereses.add('Música');
    if (_tecnologia) intereses.add('Tecnología');

    setState(() {
      _resultado = '✅ Intereses seleccionados:\n'
          '${intereses.isEmpty ? "Ninguno" : intereses.join(", ")}\n\n'
          '📊 Nivel: ${_nivel ?? "Ninguno"}\n\n'
          '🔔 Notificaciones: ${_notificaciones ? "Activadas" : "Desactivadas"}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('Elementos de Selección'),
        backgroundColor: const Color(0xFFFFF3E0),
        foregroundColor: const Color(0xFFF57C00),
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
                '✅ Elementos de Selección',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF57C00),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Explicación
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                '💡 Permiten al usuario seleccionar opciones: Checkbox (múltiple), RadioButton (única), Switch (on/off).',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Checkboxes
            const Text(
              '⚡ Checkbox - Selección múltiple:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF57C00),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selecciona tus intereses:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            
            CheckboxListTile(
              title: const Text('Deportes'),
              value: _deportes,
              onChanged: (bool? value) {
                setState(() {
                  _deportes = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            
            CheckboxListTile(
              title: const Text('Música'),
              value: _musica,
              onChanged: (bool? value) {
                setState(() {
                  _musica = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            
            CheckboxListTile(
              title: const Text('Tecnología'),
              value: _tecnologia,
              onChanged: (bool? value) {
                setState(() {
                  _tecnologia = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            
            const SizedBox(height: 24),
            
            // RadioButtons
            const Text(
              '⚡ RadioButton - Selección única:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF57C00),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selecciona tu nivel:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            
            RadioListTile<String>(
              title: const Text('Principiante'),
              value: 'Principiante',
              groupValue: _nivel,
              onChanged: (String? value) {
                setState(() {
                  _nivel = value;
                });
              },
              contentPadding: EdgeInsets.zero,
            ),
            
            RadioListTile<String>(
              title: const Text('Intermedio'),
              value: 'Intermedio',
              groupValue: _nivel,
              onChanged: (String? value) {
                setState(() {
                  _nivel = value;
                });
              },
              contentPadding: EdgeInsets.zero,
            ),
            
            RadioListTile<String>(
              title: const Text('Avanzado'),
              value: 'Avanzado',
              groupValue: _nivel,
              onChanged: (String? value) {
                setState(() {
                  _nivel = value;
                });
              },
              contentPadding: EdgeInsets.zero,
            ),
            
            const SizedBox(height: 24),
            
            // Switch
            const Text(
              '⚡ Switch - Activar/Desactivar:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF57C00),
              ),
            ),
            const SizedBox(height: 8),
            
            SwitchListTile(
              title: const Text('Recibir notificaciones'),
              value: _notificaciones,
              onChanged: (bool value) {
                setState(() {
                  _notificaciones = value;
                });
                
                final estado = value ? 'activadas' : 'desactivadas';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Notificaciones $estado'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              contentPadding: EdgeInsets.zero,
            ),
            
            const SizedBox(height: 24),
            
            // Botón para mostrar resultados
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _mostrarSelecciones,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Mostrar Selecciones',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            
            const SizedBox(height: 16),

                          const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectionDetailScreen(),
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