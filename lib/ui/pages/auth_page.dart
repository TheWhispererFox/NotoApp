import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/domain/user/user_bloc.dart';
import 'package:noto_app/ui/constants.dart';
import 'package:noto_app/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final UserBloc _bloc;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _bloc = context.read();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _bloc.stateStream
        .map((event) => event.error)
        .where((event) => event != null)
        .listen((event) {
      context.scaffoldMessenger
          .showSnackBar(SnackBar(content: Text(event!.toString())));
    });
    _bloc.stateStream
        .map((event) => event.userCredential)
        .where((event) => event != null)
        .listen((event) {
      AutoRouter.of(context).push(const NotesPageRoute());
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
                  ElevatedButton(
                    onPressed: () async {
                      _bloc.signInWithEmail(
                        _emailController.value.text,
                        _passwordController.value.text,
                      );
                    },
                    child: const Text('Sign In'),
                  ),
                  const Text('-----OR------'),
                  ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const RegisterPageRoute());
                    },
                    child: const Text("Create Account"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
