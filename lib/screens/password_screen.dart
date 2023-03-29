import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:finner/Utils/cons.dart';
import 'package:finner/widget/card.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> 

 with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  final _globalKey = GlobalKey<FormState>();
  final emailuserController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceInOut,
    );
    _iconAnimation.addListener(() => setState(() {}));
      _iconAnimationController.forward();
  }

 
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: getOtherScreenAppBar('Recuperar contraseña', context),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        const Image(
          image: AssetImage("assets/nieve.gif"),
          fit: BoxFit.cover,
          color: Color.fromARGB(221, 255, 255, 255),
          colorBlendMode: BlendMode.darken,
        ),
        SafeArea(
          
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
                                inputDecorationTheme: const InputDecorationTheme(
                                    labelStyle: TextStyle(
                                        color: Colors.teal, fontSize: 15.0))),
                            child: SafeArea(
                                child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    
                                    SizedBox(
                                      height: 250,
                                      child: Center(
                                          child: Lottie.asset(
                                              'assets/animations/security.json',
                                              repeat: true,
                                              fit: BoxFit.contain)),
                                    ),

                                    TextFormField(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      controller: emailuserController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ("Por favor escriba un correo electronico valido");
                                        }
                                        // reg expression for email validation
                                        if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(value)) {
                                          return ("Por favor escriba un correo electronico valido");
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        emailuserController.text = value!;
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.email,
                                            color: Colors.red,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3, color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          hintText:
                                              "Correo@electronico.prueba ",
                                          fillColor:
                                              const Color.fromARGB(255, 137, 0, 0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          labelText: "Ingrese su correo"),
                                      textAlign: TextAlign.center,
                                    ),
                                    
                                    const SizedBox(
                                      height: 40,
                                    ),

                                   getbutton(context, 'Enviar contraseña'),
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
        ]
      ),
    );
  }
}

