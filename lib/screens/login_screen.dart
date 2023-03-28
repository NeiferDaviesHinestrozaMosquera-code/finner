import 'package:finner/cons/button.dart';
import 'package:finner/cons/card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
        SafeArea(
          child: Flexible(
            child: CardContainer(
              child: Column(
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
                                      SizedBox(
                                        height: 300 ,
                                        //child: Image.network('https://assets3.lottiefiles.com/packages/lf20_edzccurz.json'),
                                        child: Center(child:Lottie.asset('assets/animations/cartoon.json', repeat: true, fit: BoxFit.contain)),
                                       
                                        ),
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
                                           prefixIcon: const Icon(Icons.email, color: Colors.red,),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 3,color: Colors.teal
                                              ),
                                            borderRadius: BorderRadius.circular(50)
                                          ),
                                            hintText: "Correo@electronico.prueba " , 
                                          fillColor: Color.fromARGB(255, 137, 0, 0),
                                           border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)
                                      
                                        ),
                                          labelText: "Ingrese su correo"),
                                          textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 5,) , 
            
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
                                            prefixIcon: const Icon(Icons.security, color: Colors.red,),
                                             enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 3,color: Colors.teal
                                              ),
                                            borderRadius: BorderRadius.circular(50)
                                          ),
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
                                      borderRadius: BorderRadius.circular(50)
                                        
                                        ),
                                          labelText: "Ingrese su contraseña"
                                          ),
                                          
                                          textAlign: TextAlign.center,
                                          
                                      ),
                                      TextButton(
                                        onPressed: (){
                  
                                        },
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text('Se olvido la contraseña?'
                                        ),
                                      )
                                    ),
                                     
                                      
                                 ButtonGr(),
                  
                                 SizedBox(height: 20,),
                                    ///
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(' ¿Todavia no tienes una cuenta ?'),
                                        GestureDetector(
                                          onTap: (){
                                      //       Navigator.push(
                                      // context,
                                      // MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         RegistrationScreen()));
                                          },
                                          child: Text(
                                            "  Registro" , 
                                            style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                            fontSize: 15
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(color: Colors.transparent,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton.icon(onPressed: (){}, icon: Icon(Icons.facebook), label: Text('Facebook')),
                                        TextButton.icon(onPressed: (){}, icon: Icon(Icons.email_sharp), label: Text('Gmail')),
                                        TextButton.icon(onPressed: (){}, icon: Icon(Icons.phone_android), label: Text('Telefono'))
                                      ],
                                    )
                                      
                                ]
                              ),
                            )
                          ),
                        )
                      )
                    )
                  ],
                ),
            ),
          ),
        )
        ]
      ),
    );
  }
}
