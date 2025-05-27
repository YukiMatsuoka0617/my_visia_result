import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/screens/input/screen/input_data_screen.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    super.key,
    required this.onPushSaveButton,
  });

  final Future<void> Function() onPushSaveButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: const Text(
        'My VISIA History',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InputDataScreen(),
              ),
            );

            if (result != null) {
              if (result) {
                onPushSaveButton();
              }
            }
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
