import 'package:flutter/material.dart';
import 'package:noto_app/domain/user/user_bloc.dart';
import 'package:noto_app/domain/user/user_state.dart';
import 'package:noto_app/ui/constants.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final UserBloc _bloc;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _repeatPasswordController;

  @override
  void dispose() {
    _bloc.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc.stateStream.listen((event) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(event.error.name)));
    });
  }

  @override
  void initState() {
    _bloc = context.read();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: defaultPadding,
        child: Center(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  controller: _emailController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  controller: _passwordController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Repeat Password',
                  ),
                  controller: _repeatPasswordController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_passwordController.value ==
                        _repeatPasswordController.value) {
                      await _bloc.events.registerUserWithEmail(
                        _emailController.value.text,
                        _passwordController.value.text,
                      );
                    } else {
                      _bloc.updateState(
                        (b) => b.error = ErrorCode.passwordDontMatch,
                      );
                    }
                  },
                  child: const Text('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
