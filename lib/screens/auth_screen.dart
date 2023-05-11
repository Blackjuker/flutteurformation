import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:formation/widgets/appbar_widget.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();

  //état du formulaire
  final _formKey = GlobalKey<FormState>();
  //stocker la saisie
  Map<String, String> _formType = {'username': '', 'password': ''};
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // inspect(_memeService.getMemes());

    return Scaffold(
      appBar: const AppbarWidget(),
      body: Container(
          padding: const EdgeInsets.all(25),
          alignment: Alignment.center,
          child: Form(
            key: widget._formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Login'),
                  ),
                  onChanged: (String value) {
                    widget._formType['username'] = value;
                  },
                  validator: (String? value) =>
                      value!.isEmpty ? 'Login error' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Pasword'),
                  ),
                  onChanged: (String value) {
                    widget._formType['password'] = value;
                  },
                  validator: (String? value) =>
                      value!.isEmpty ? 'password error' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //si le formulaire est valide
                    if (widget._formKey.currentState!.validate()) {
                      //sauvegarder l'état du formulaire
                      widget._formKey.currentState!.save();
                      inspect(widget._formType);
                    }
                  },
                  child: const Text('Connect'),
                )
              ],
            ),
          )),
    );
  }
}
