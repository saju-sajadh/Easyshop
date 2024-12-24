import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/auth_controller.dart';

class MyAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  ConsumerState<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends ConsumerState<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final hasDrawer = Scaffold.of(context).hasDrawer;
    return AppBar(  
      automaticallyImplyLeading: hasDrawer,
      title: const Text('Easyshop'),
      backgroundColor: Color(0xFFFF7643),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String item) {
            switch (item) {
              case 'profile':
                Navigator.pushNamed(context, '/profile');
                break;
              case 'settings':
                // Handle settings navigation
                Navigator.pushNamed(context, '/settings');
                break;
              case 'logout':
                // Handle logout
                ref.read(authControllerProvider.notifier).logout(context);
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ];
          },
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}