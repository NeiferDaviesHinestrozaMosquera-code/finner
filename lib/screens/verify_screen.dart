import 'package:flutter/material.dart';
import 'package:finner/Utils/cons.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getOtherScreenAppBar('Prueba', context),
      body: Text('Test prueba'),
    );
  }
}