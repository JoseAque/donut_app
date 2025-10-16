import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String iconName;
  const MyTab({super.key, required this.iconPath, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // contenedor solo para la imagen
          Container(
            width: 75,
            height: 75,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(iconPath, color: Colors.grey[600]),
          ),
          const SizedBox(height: 6),
          // texto colocado debajo del contenedor
          Text(iconName, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
