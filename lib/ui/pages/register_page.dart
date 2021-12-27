import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:noto_app/domain/user/user_bloc.dart';
import 'package:noto_app/ui/constants.dart';
import 'package:noto_app/utils/extensions/context_extension.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _bloc = context.read();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();

    _bloc.stateStream
        .map((event) => event.error)
        .where((event) => event != null)
        .listen((event) {
      context.scaffoldMessenger
          .showSnackBar(SnackBar(content: Text(event!.toString())));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                        await _bloc.registerUserWithEmail(
                          _emailController.value.text,
                          _passwordController.value.text,
                        );
                      } else {
                        _bloc.passwordDontMatch();
                      }
                    },
                    child: const Text('Sign up'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                    child: const Text('Already have an account?'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
