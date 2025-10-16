import 'package:flutter/material.dart';
import 'package:donut_app/utils/my_tab.dart';
import 'package:donut_app/tab/burger_tab.dart';
import 'package:donut_app/tab/donut_tab.dart';
import 'package:donut_app/tab/pancake.dart';
import 'package:donut_app/tab/pizza_tab.dart';
import 'package:donut_app/tab/smoothie_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //donut tab
    MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donuts'),
    //burger tab
    MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
    //smoothie tab
    MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
    //pancakes tab
    MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'PanCake'),
    //pizza tab
    MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //Icono izquierdo
          leading: Icon(Icons.menu, color: Colors.grey[500], size: 30),
          //Icono derecho
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, size: 30),
            ),
          ],
        ),
        body: Column(
          children: [
            //1. Texto Principal
            Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text('I want to ', style: TextStyle(fontSize: 30)),
                  Text(
                    'eat',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            //2. Pestañas (TabBar)
            TabBar(tabs: myTabs),
            //3. Contenido de las pestañas (TabBarView)
            SizedBox(height: 30),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PanCakeTab(),
                  PizzaTab(),
                ],
              ),
            ),

            //4. Carrito (Cart)
          ],
        ),
      ),
    );
  }
}
