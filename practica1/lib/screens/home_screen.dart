import 'package:flutter/material.dart';
import 'text_fields_screen.dart';
import 'buttons_screen.dart';
import 'selection_screen.dart';
import 'lists_screen.dart';
import 'info_elements_screen.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              
              // Título de bienvenida
              const Text(
                'Bienvenido a la Práctica 1',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Subtítulo
              const Text(
                'Elige el tema que quieras conocer y ver ejemplos',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF424242),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Tarjetas de navegación
              CustomCard(
                title: 'TextFields',
                color: const Color(0xFFE3F2FD),
                textColor: const Color(0xFF1976D2),
                onTap: () => _navigateToScreen(context, const TextFieldsScreen()),
              ),
              
              const SizedBox(height: 8),
              
              CustomCard(
                title: 'Buttons',
                color: const Color(0xFFE8F5E8),
                textColor: const Color(0xFF388E3C),
                onTap: () => _navigateToScreen(context, const ButtonsScreen()),
              ),
              
              const SizedBox(height: 8),
              
              CustomCard(
                title: 'Selection',
                color: const Color(0xFFFFF3E0),
                textColor: const Color(0xFFF57C00),
                onTap: () => _navigateToScreen(context, const SelectionScreen()),
              ),
              
              const SizedBox(height: 8),
              
              CustomCard(
                title: 'Lists',
                color: const Color(0xFFFCE4EC),
                textColor: const Color(0xFFC2185B),
                onTap: () => _navigateToScreen(context, const ListsScreen()),
              ),
              
              const SizedBox(height: 8),
              
              CustomCard(
                title: 'Info Elements',
                color: const Color(0xFFF3E5F5),
                textColor: const Color(0xFF7B1FA2),
                onTap: () => _navigateToScreen(context, const InfoElementsScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}