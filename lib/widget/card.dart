import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.only(left:15 , right: 15, top:26 , bottom:26 ),
        //padding:  EdgeInsets.symmetric(horizontal: 26 , vertical: 1),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: _createCardShape(),
          child: child,  ///DE LA LINEA SUPERIOR
        ),
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,5), ///MOVIMIENTO DE LA SOMBRA
      )
    ]
  );
}

