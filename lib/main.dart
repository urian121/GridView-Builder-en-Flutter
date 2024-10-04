import 'package:flutter/material.dart';

// Punto de entrada principal de la aplicación
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false, // Oculta el banner de depuración
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView Builder 👌', style: TextStyle(color: Colors.white),),
          centerTitle: true, // Centra el título en la AppBar
          backgroundColor: Colors.purple[200], // Color del AppBar
        ),
        body:  HomeScreen(), // Llama a la pantalla principal
      ),
    );
  }
}

// Pantalla principal
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Lista de productos generada dinámicamente con 100 items
  final List<Map> myProducts =
      List.generate(100, (index) => {"id": index, "nombre": "Producto # $index"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Padding alrededor del GridView
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // Máximo ancho de cada item
          childAspectRatio: 3 / 2, // Proporción entre ancho y alto de cada item
          crossAxisSpacing: 20, // Espacio horizontal entre los items
          mainAxisSpacing: 20, // Espacio vertical entre los items
        ),
        itemCount: myProducts.length, // Número total de productos
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center, // Centra el texto dentro del contenedor
            decoration: BoxDecoration(
              color: Colors.purple[400], // Color de fondo del contenedor
              borderRadius: BorderRadius.circular(15), // Bordes redondeados
            ),
            // Texto de cada producto
            child: Text(
              myProducts[index]["nombre"],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold, // Negrita en el texto
              ),
            ),
          );
        },
      ),
    );
  }
}
