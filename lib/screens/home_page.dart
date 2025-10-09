import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //Icono izquierdo
        leading: Icon(Icons.menu, color: Colors.grey[500]),
        //Icono derecho
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: const Column(
        children: [
          //1. Texto Principal

          //2. Pestañas (TabBar)

          //3. Contenido de las pestañas (TabBarView)

          //4. Carrito (Cart)
        ],
      ),
    );
  }
}
