import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/domain/user/user_bloc.dart';
import 'package:noto_app/utils/extensions/context_extension.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';
import 'package:provider/provider.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeBloc _themeBloc = useMemoized(() => context.read());

    final UserBloc _userBloc = useMemoized(() => context.read());

    return Scaffold(
      appBar: AppBar(
        title: Text(context.lang!.settings),
      ),
      body: ListView(
        children: [
          _themeBloc.stateStream.builderNoLoading(
            onData: (context, state) {
              return SwitchListTile(
                secondary: const Icon(Icons.dark_mode),
                title: Text(context.lang!.darkMode),
                value: state.themeMode == ThemeMode.dark,
                onChanged: (_) {
                  _themeBloc.switchTheme();
                },
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              _userBloc.signOut();
              AutoRouter.of(context).popUntilRouteWithName(AuthPageRoute.name);
            },
            child: Text(context.lang!.signOut),
          )
        ],
      ),
    );
  }
}
