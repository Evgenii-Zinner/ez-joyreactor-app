import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ez_joyreactor_app/core/core.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //TODO create login screen
        const Scaffold(
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _loginController,
            decoration: const InputDecoration(
              labelText: 'Login',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              String login = _loginController.text;
              String password = _passwordController.text;

              if (login.isEmpty || password.isEmpty) {
                // Show snackbar for empty fields
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter login and password')),
                );
                return;
              }

              bool status = await Provider.of<MutationsProvider>(context, listen: false)
                  .login(login, password);
              debugPrint('Login: $login, Password: $password');
              if (!status) {
                // Show snackbar for empty fields
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Wrong login or password')),
                );
                return;
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
