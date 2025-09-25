import 'package:flutter/material.dart';

// TextFields Detail Screen
class TextFieldsDetailScreen extends StatelessWidget {
  const TextFieldsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFields Detail'),
        backgroundColor: const Color(0xFFE3F2FD),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 800),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: value,
                child: child,
              ),
            );
          },
          child: const Text(
            'Holaaa\nEsta es otra SCREEN\n(TextFields Detail)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

// Buttons Detail Screen
class ButtonsDetailScreen extends StatelessWidget {
  const ButtonsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Detail'),
        backgroundColor: const Color(0xFFE8F5E8),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 800),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(-50 * (1 - value), 0),
                child: child,
              ),
            );
          },
          child: const Text(
            'Holaaa\nEsta es otra SCREEN\n(Buttons Detail)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF388E3C),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

// Selection Detail Screen
class SelectionDetailScreen extends StatelessWidget {
  const SelectionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Detail'),
        backgroundColor: const Color(0xFFFFF3E0),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 800),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: value,
                child: child,
              ),
            );
          },
          child: const Text(
            'Holaaa\nEsta es otra SCREEN\n(Selection Detail)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF57C00),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

// Lists Detail Screen
class ListsDetailScreen extends StatelessWidget {
  const ListsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists Detail'),
        backgroundColor: const Color(0xFFFCE4EC),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 800),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(-50 * (1 - value), 0),
                child: child,
              ),
            );
          },
          child: const Text(
            'Holaaa\nEsta es otra SCREEN\n(Lists Detail)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC2185B),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

// Info Elements Detail Screen
class InfoElementsDetailScreen extends StatelessWidget {
  const InfoElementsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Elements Detail'),
        backgroundColor: const Color(0xFFF3E5F5),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 800),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: value,
                child: child,
              ),
            );
          },
          child: const Text(
            'Holaaa\nEsta es otra SCREEN\n(Info Elements Detail)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7B1FA2),
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}