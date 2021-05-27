import 'package:flutter/material.dart';

void main() => runApp(MiAppInteractiva());

class MiAppInteractiva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interactiva App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Inicio(title: 'Interactiva App Aerolinea'),
    ); //App Material
  } //Constructor
} //Clase MiAppInteractiva

class Inicio extends StatefulWidget {
  Inicio({Key key, this.title }) : super(key: key);
  final String title;
  
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String elegirValor;
  List listItem = [
    'Light', 'Más de 10Kg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1),
        centerTitle: true,
        title: Text(
          'Interactiva App Aeropueto',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LimitedBox(
              maxWidth: 350.0,
              maxHeight: 300.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://raw.githubusercontent.com/karla1901/MisFotos/main/vuelo.jpg',
                  fit: BoxFit.cover,
                ),//Sacando de internet
              ),// 1. Imagen con borde redondo 
            ),
            
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFF212121),
                  ),
                ),
                labelText: 'Nombre Completo',
              ),
            ), //2. Campo de Texto
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFF212121),
                  ),
                ),
                labelText: 'Aerolinea con la que viajará',
              ),
            ), //3. Campo de Texto
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                new Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF212121),
                        ),
                      ),
                      labelText: 'Hora de vuelo (hr,min)',
                    ),//Decoración de Textfield
                  ),//TexField
                ),//Flexible para que el TextField entre en la Row 
                SizedBox(width: 16,),
                Container(
                  padding: const EdgeInsets.fromLTRB(
                    8.0, 
                    0.0, 
                    8.0, 
                    0.0
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF212121), width: 1),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child:DropdownButton(
                    hint: Text(
                      "Equipaje: ",
                      style: TextStyle(
                        color: Color(0xFF212121),
                      ),
                    ),
                    dropdownColor: Color(0xFFB0BEC5),
                    iconSize: 20,
                    underline: SizedBox(),
                    value: elegirValor,
                    onChanged: (newValue){
                      setState((){
                        elegirValor = newValue;
                        
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );//Dropdown Menu Item
                    }).toList(),
                  ),//Dropdown 
                ),//Contenedor de Dropdown
              ],//Widgets dentro de Row
            ),//4. Row
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('INGRESAR'),
                  icon: Icon(Icons.check_rounded),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    minimumSize: Size(120,50),
                  ),
                ),//Elevated Button 1
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('CANCELAR'),
                  icon: Icon(Icons.close_rounded),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    onPrimary: Colors.white,
                    minimumSize: Size(180,50),
                  ),
                )//Elevated Button 1
              ],//Hijos de Row
            ),//5. Row
          ], //Widgets dentro de Columna
        ), //Columna Principal
      ),
    ); //Scaffold
  } //Constructor
} //Clase Inicio