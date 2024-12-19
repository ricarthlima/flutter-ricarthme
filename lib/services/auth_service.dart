import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }

  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  Future<dynamic> showAuthDialog(BuildContext context) async {
    bool isLoading = false;

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            TextEditingController _emailController = TextEditingController();
            TextEditingController _passwordController = TextEditingController();
            GlobalKey<FormState> _key = GlobalKey<FormState>();

            return Form(
              key: _key,
              child: AlertDialog(
                actionsPadding: EdgeInsets.all(32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                icon: Icon(Icons.person_2),
                iconColor: Colors.purple,
                title: Text("Autenticação"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: "E-mail"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: "Senha"),
                      obscureText: true,
                    ),
                  ],
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text("Cancelar"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.purple)),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      authenticateWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ).then(
                        (value) {
                          Navigator.pop(context, true);
                          setState(() {
                            isLoading = false;
                          });
                        },
                      );
                    },
                    child: (isLoading)
                        ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(),
                          )
                        : Text("Entrar"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<UserCredential> authenticateWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
