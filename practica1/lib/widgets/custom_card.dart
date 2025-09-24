import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: textColor,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}