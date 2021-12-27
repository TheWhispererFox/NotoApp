import 'package:flutter/material.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/utils/extensions/context_extension.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        ],
      ),
    );
  }
}
