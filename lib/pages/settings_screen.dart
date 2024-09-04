import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChange;
  final Settings settings;
  const SettingsScreen({
    super.key,
    required this.onSettingsChange,
    required this.settings,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text('Configurações'),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                    title: 'Sem Glútem',
                    subtitle: 'Só refeições sem glútem',
                    value: settings.isGlutenFree,
                    onChanged: (value) =>
                        setState(() => settings.isGlutenFree = value)),
                _createSwitch(
                    title: 'Sem Lactose',
                    subtitle: 'Só refeições sem Lactose',
                    value: settings.isLactoseFree,
                    onChanged: (value) =>
                        setState(() => settings.isLactoseFree = value)),
                _createSwitch(
                    title: 'Veganas',
                    subtitle: 'Só refeições veganas',
                    value: settings.isVegan,
                    onChanged: (value) =>
                        setState(() => settings.isVegan = value)),
                _createSwitch(
                    title: 'Vegetariana',
                    subtitle: 'Só refeições vegetarianas',
                    value: settings.isVegetarian,
                    onChanged: (value) =>
                        setState(() => settings.isVegetarian = value)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
