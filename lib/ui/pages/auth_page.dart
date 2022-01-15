import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noto_app/app/app.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/domain/user/user_bloc.dart';
import 'package:noto_app/ui/constants.dart';
import 'package:noto_app/utils/extensions/context_extension.dart';
import 'package:provider/src/provider.dart';

class AuthPage extends HookWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AutoDisposeProviderRef<UserBloc> ref = Ref();
    final _bloc = userBlocProvider.create(ref);

    useEffect(
      () {
        final subscription = _bloc.stateStream
            .map((event) => event.error)
            .where((event) => event != null)
            .listen((event) {
          context.scaffoldMessenger
              .showSnackBar(SnackBar(content: Text(event!.toString())));
        });

        return subscription.cancel;
      },
      [_bloc.stateStream],
    );

    useEffect(
      () {
        final subscription = _bloc.stateStream
            .map((event) => event.userCredential)
            .where((event) => event != null)
            .listen((event) {
          AutoRouter.of(context).push(const NotesPageRoute());
        });

        return subscription.cancel;
      },
      [_bloc.stateStream],
    );

    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();

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
