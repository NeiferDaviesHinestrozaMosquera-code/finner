import 'package:finner/screens/password_screen.dart';
import 'package:finner/widget/card.dart';
import 'package:finner/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:finner/Utils/cons.dart';

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
                                              'assets/animations/cartoon.json',
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
                                      height: 5,
                                    ),

                                    TextFormField(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      controller: passworduserController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      obscureText:
                                          _passworduserControllerVisible,
                                      obscuringCharacter: "*",
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: (value) {
                                        RegExp regex =  RegExp(r'^.{8,}$');
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
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.security,
                                            color: Colors.red,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 3, color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _passworduserControllerVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passworduserControllerVisible =
                                                    !_passworduserControllerVisible;
                                              });
                                            },
                                          ),
                                          //hintText: "******" , fillColor: Colors.redAccent,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          labelText: "Ingrese su contraseña"),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          pushNavigate(
                                              context, const ForgotPasswordScreen());
                                        },
                                        child: const Align(
                                          alignment: Alignment.bottomRight,
                                          child:
                                              Text('Se olvido la contraseña?'),
                                        )),

                                   getbutton(context, 'Inicar sesion'),

                                    const SizedBox(
                                      height: 20,
                                    ),

                                    ///
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                            ' ¿Todavia no tienes una cuenta ?'),
                                        GestureDetector(
                                          onTap: () {
                                            pushAndRemoveNavigate(
                                                context, const SignUpScreen());
                                          },
                                          child: const Text(
                                            "  Registro",
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.transparent,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.facebook),
                                            label: const Text('Facebook')),
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.email_sharp),
                                            label: const Text('Gmail')),
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.phone_android),
                                            label: const Text('Telefono'))
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
        ]
      ),
    );
  }
}
