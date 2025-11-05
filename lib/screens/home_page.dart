import 'package:flutter/material.dart';
import 'package:donut_app/utils/my_tab.dart';
import 'package:donut_app/tab/burger_tab.dart';
import 'package:donut_app/tab/donut_tab.dart';
import 'package:donut_app/tab/pancake_tab.dart';
import 'package:donut_app/tab/pizza_tab.dart';
import 'package:donut_app/tab/smoothie_tab.dart';
import 'package:donut_app/utils/cart_item.dart';
import 'package:donut_app/utils/cart_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CartItem> cartItems = [];

  //Getters para el contador y total
  int get itemCount => cartItems.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice =>
      cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  //Función para agregar items al carrito
  void addToCart(String name, double price, String imagePath) {
    setState(() {
      //Buscar si el producto ya está en el carrito
      final existingItemIndex = cartItems.indexWhere(
        (item) => item.name == name,
      );

      if (existingItemIndex != -1) {
        //Si ya existe, incrementar la cantidad
        cartItems[existingItemIndex].quantity++;
      } else {
        //Si no existe, agregarlo
        cartItems.add(
          CartItem(name: name, price: price, imagePath: imagePath, quantity: 1),
        );
      }
    });
  }

  //Función para mostrar el carrito
  void showCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CartBottomSheet(
        cartItems: cartItems,
        onCartUpdated: () => setState(() {}),
      ),
    );
  }

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
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.grey[500],
            iconSize: 30,
            onPressed: () {},
          ),
          //Icono derecho
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: const Icon(Icons.person),
                iconSize: 30,
                onPressed: () {},
              ),
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
                  Text('I want to ', style: GoogleFonts.roboto(fontSize: 40)),
                  Text(
                    'eat',
                    style: GoogleFonts.roboto(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            //2. Pestañas (TabBar)
            TabBar(tabs: myTabs),
            //3. Contenido de las pestañas (TabBarView)
            SizedBox(height: 30),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(onAddToCart: addToCart),
                  BurgerTab(onAddToCart: addToCart),
                  SmoothieTab(onAddToCart: addToCart),
                  PancakeTab(onAddToCart: addToCart),
                  PizzaTab(onAddToCart: addToCart),
                ],
              ),
            ),

            //4. Carrito (Cart)
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Column(
                      //se pega a la izquierda
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$itemCount ${itemCount == 1 ? 'Item' : 'Items'} | \$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Delivery charges included',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  //botón de checkout
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    onPressed: showCart,
                    child: const Text(
                      'View Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
