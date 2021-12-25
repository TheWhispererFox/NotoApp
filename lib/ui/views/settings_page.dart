import 'package:flutter/material.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late final ThemeBloc _themeBloc;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _themeBloc = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          _themeBloc.stateStream.builderNoLoading(
            onData: (context, state) {
              return SwitchListTile(
                secondary: const Icon(Icons.dark_mode),
                title: const Text("Dark mode"),
                value: state.themeMode == ThemeMode.dark,
                onChanged: (_) {
                  _themeBloc.events.switchTheme();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
