import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  final _globalKey = GlobalKey<FormState>();
  final emailuserController = TextEditingController();
  final passworduserController = TextEditingController();
  bool _passworduserControllerVisible = true;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceInOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Image(
          image: AssetImage("assets/nieve.gif"),
          fit: BoxFit.cover,
          color: Color.fromARGB(221, 255, 255, 255),
          colorBlendMode: BlendMode.darken,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
                child: Form(
                  key: _globalKey,
                    child: Theme(
              data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle:
                          TextStyle(color: Colors.teal, fontSize: 15.0))),
              child: SafeArea(child: Container(
                padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                 TextFormField(
                                  controller: emailuserController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                 keyboardType: TextInputType.emailAddress,
                                 validator: (value) {
                                          if (value!.isEmpty) {
                                            return ("Por favor escriba un correo electronico valido");
                                          }
                                          // reg expression for email validation
                                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                              .hasMatch(value)) {
                                            return ("Por favor escriba un correo electronico valido");
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          emailuserController.text = value!;
                                        },
                                  decoration:  InputDecoration(
                                      hintText: "Correo@electronico.prueba " , fillColor: Colors.redAccent,
                                     border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                                
                                  ),
                                    labelText: "Ingrese su correo"),
                                    textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 15,) , 

                                TextFormField(
                                  controller: passworduserController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  obscureText: _passworduserControllerVisible,
                                  obscuringCharacter: "*",
                                  keyboardType: TextInputType.visiblePassword,
                                     validator: (value) {
                                    RegExp regex = new RegExp(r'^.{8,}$');
                                    if (value!.isEmpty) {
                                      return ("Contraseña es requerida para inicializar sesion");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Escriba una contraseña con almenos 8 caracteres");
                                    }
                                  },
                                  
                                  onSaved: (value) {
                                    passworduserController.text = value!;
                                    
                                  },
                                    decoration:  InputDecoration(
                                      
                                      suffixIcon: IconButton(
                                        
                                        icon: Icon(
                                          _passworduserControllerVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                        color: Theme.of(context).primaryColorDark,
                                        ),
                                        onPressed: (){
                                          setState(() {
                                            _passworduserControllerVisible = ! _passworduserControllerVisible;
                                          });
                                        },
                                        
                                      ),
                                      
                                      
                                      //hintText: "******" , fillColor: Colors.redAccent,
                                     border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                                  
                                  ),
                                    labelText: "Ingrese su contraseña"
                                    ),
                                    
                                    textAlign: TextAlign.center,
                                    
                                ),
                                
                          ]
                        ),
                      )
                    ),
                  )
                )
              )
            ],
          )
        ]
      ),
    );
  }
}
