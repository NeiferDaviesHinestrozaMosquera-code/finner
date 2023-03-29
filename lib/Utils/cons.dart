import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:loading_indicator/loading_indicator.dart';

//ESTO ES LA información DE APPBAR QUE ESTA EN HOME
getOtherScreenAppBar(String title ,BuildContext context) {
  return  AppBar(
      

        // actions: [
        //   IconButton(onPressed: (){}, 
        //   icon: Icon(Icons.notifications))
        // ],
        
        toolbarHeight: 80,
        elevation: 0,
        title: Text(title) ,
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), //SIRVE PARA DAR FORMA AL APPBAR 
        flexibleSpace: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
            height: 250,
            color: Colors.teal,
            ),

            ///
            Container(
            decoration: BoxDecoration(
               color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50)
              )
            ),
            height: 20,
            //color: Colors.white,
          )
          ]
        ),
      );
}

//SE DEFINE LA FUENTE , COLOR , TAMAÑO Y ALINEACION (BOLD)
getBoldText(String text,  Color color , double size,) {
  return  Text(text , 
                style: TextStyle(
                  fontSize: size ,
                  fontWeight: FontWeight.bold,
                  color: color
                  ),
                  textAlign: TextAlign.start,
                );
}

//SE DEFINE LA FUENTE , COLOR , TAMAÑO Y ALINEACION (NORMAL)
getNormalText(String text,  Color color , double size) {
  return  Text(text , 
                style: TextStyle(
                  fontSize: size ,
                  color: color
                  ),
                  textAlign: TextAlign.start,
                );
}

////NAVEGAR ENTRE LAS PAGINAS CON LA AYUDA DE WIDGET QUE ES REUTILIZABLE 
pushNavigate( BuildContext context , Widget widget) {
  return   Navigator.push(context , MaterialPageRoute(builder: (context) => widget));

}

////
pushAndRemoveNavigate(BuildContext context, Widget widget) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: ((context) => widget)), (route) => false);
}

///
getButton (String text , Color color , VoidCallback onTap) {
  return InkWell(
                  onTap: onTap,
                        //overlayColor: MaterialStateProperty.resolveWith((states) => null),
                  child: Container(
                    padding: EdgeInsets.all(8),
                          
                      decoration: BoxDecoration(
                        color: color , borderRadius: BorderRadius.circular(10)
                      ),
                      child: getNormalText(text, Colors.white, 16),
                        ),
                      );
}

///
Widget getLoading() {
  return Center(
    child: Container(
      width: 50,
      child: LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader, /// Required, The loading type of the widget
        
        colors: const [Colors.red],       /// Optional, The color collections
        
        strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
        
        backgroundColor: Colors.transparent,      /// Optional, Background of the widget
        
        pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
        
      ),
    
    ),
    
  );
}

//MENSAJE EMERGENTE PARA XXXXXX
getSnackbar(String text, BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: getNormalText(
                                  text, 
                                  Colors.white,
                                   16
                                )
                              ),
                            );
}

////INFORMACION
getAnimatedSnackbarInfo(String text ,BuildContext context){
 AnimatedSnackBar.material(text,
                          type: AnimatedSnackBarType.info,
                          mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                          desktopSnackBarPosition:
                              DesktopSnackBarPosition.bottomLeft)
                      .show(context);
}

//ERROR
getAnimatedSnackbarError(String text ,BuildContext context){
 AnimatedSnackBar.material(
                    text,
                    type: AnimatedSnackBarType.error,
                    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
                  ).show(context);
}

getAnimatedSnackbarSuccess(String text ,BuildContext context){
 AnimatedSnackBar.material(
                    text,
                    type: AnimatedSnackBarType.success,
                    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                    desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
                  ).show(context);
}

getAnimatedSnackbarWarning(String text ,BuildContext context){
 AnimatedSnackBar.material(
                    text,
                    type: AnimatedSnackBarType.warning,
                  ).show(context);
}

getbutton(BuildContext context , String text){
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
                  child: Text(text),
                ),
              ],
           ),
          )
        ]
      )
    );
}