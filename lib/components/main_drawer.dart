import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    createItem(IconData icon, String title, Function() onTap) {
      return ListTile(
          leading: Icon(
            icon,
            size: 26,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: onTap);
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          createItem(Icons.restaurant, 'Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.home)),
          createItem(
            Icons.settings,
            'Configurações',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
          ),
        ],
      ),
    );
  }
}
