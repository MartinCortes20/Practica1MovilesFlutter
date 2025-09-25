import 'package:flutter/material.dart';
import 'dart:async';
import 'detail_screens.dart';

class InfoElementsScreen extends StatefulWidget {
  const InfoElementsScreen({super.key});

  @override
  State<InfoElementsScreen> createState() => _InfoElementsScreenState();
}

class _InfoElementsScreenState extends State<InfoElementsScreen> {
  String _textoDinamico = '📝 Este texto cambia dinámicamente...';
  double _progreso = 0.0;
  String _textoProgreso = 'Progreso: 0%';
  bool _cargando = false;
  
  int _indiceImagen = 0;
  Timer? _timerImagen;
  Timer? _timerProgreso;

  final List<IconData> _iconos = [
    Icons.email,
    Icons.info,
    Icons.star,
    Icons.camera_alt,
  ];

  @override
  void initState() {
    super.initState();
    _iniciarCambioImagenes();
  }

  @override
  void dispose() {
    _timerImagen?.cancel();
    _timerProgreso?.cancel();
    super.dispose();
  }

  void _iniciarCambioImagenes() {
    _timerImagen = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _indiceImagen = (_indiceImagen + 1) % _iconos.length;
      });
    });
  }

  void _simularCarga() {
    setState(() {
      _progreso = 0.0;
      _textoProgreso = 'Progreso: 0%';
      _cargando = true;
      _textoDinamico = '🚀 Iniciando proceso...';
    });

    _timerProgreso = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progreso += 0.05;
        int porcentaje = (_progreso * 100).round();
        _textoProgreso = 'Progreso: $porcentaje%';

        if (porcentaje == 25) {
          _textoDinamico = '📊 Procesando datos...';
        } else if (porcentaje == 50) {
          _textoDinamico = '🔄 Sincronizando...';
        } else if (porcentaje == 75) {
          _textoDinamico = '🎯 Finalizando...';
        } else if (porcentaje >= 100) {
          _textoDinamico = '✅ ¡Proceso completado!';
          _cargando = false;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: const Text('Elementos de Información'),
        backgroundColor: const Color(0xFFF3E5F5),
        foregroundColor: const Color(0xFF7B1FA2),
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
                '📊 Elementos de Información',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7B1FA2),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Explicación
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                '💡 Elementos para mostrar información: Text (texto), Icon/Image (imágenes), LinearProgressIndicator (progreso).',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Text dinámico
            const Text(
              '⚡ Text dinámico:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B1FA2),
              ),
            ),
            const SizedBox(height: 8),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                _textoDinamico,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Icon dinámico
            const Text(
              '⚡ Icon (cambia cada 3 segundos):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B1FA2),
              ),
            ),
            const SizedBox(height: 8),
            
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _iconos[_indiceImagen],
                  size: 64,
                  color: const Color(0xFF7B1FA2),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // LinearProgressIndicator
            const Text(
              '⚡ LinearProgressIndicator (simula carga):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B1FA2),
              ),
            ),
            const SizedBox(height: 8),
            
            LinearProgressIndicator(
              value: _progreso,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7B1FA2)),
              minHeight: 8,
            ),
            
            const SizedBox(height: 8),
            
            Center(
              child: Text(
                _textoProgreso,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Botón simular proceso
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _cargando ? null : _simularCarga,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  _cargando ? 'Procesando...' : 'Simular Proceso de Carga',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
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
                '• Text: Muestra texto estático o dinámico\n'
                '• Icon/Image: Muestra iconos, imágenes o recursos gráficos\n'
                '• LinearProgressIndicator: Indica progreso de tareas\n'
                '• Timer: Permite actualizar contenido periódicamente',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF424242),
                ),
              ),
            ),

                           const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InfoElementsDetailScreen(),
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