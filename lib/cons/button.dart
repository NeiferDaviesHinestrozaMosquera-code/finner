import 'package:flutter/material.dart';

class ButtonGr extends StatefulWidget {
  const ButtonGr({super.key});

  @override
  State<ButtonGr> createState() => _ButtonGrState();
}

class _ButtonGrState extends State<ButtonGr> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),

                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    
                  },
                  child: const Text('Iniciar sesion'),
                ),
              ],
           ),
          )
        ]
      )
    );
  }
}