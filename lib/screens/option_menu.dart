import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OptionMenu extends StatelessWidget {
  const OptionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _optionIcon(Icons.bookmark_border, 'Save'),
                  _optionIcon(LucideIcons.repeat, 'Remix'),
                  _optionIcon(LucideIcons.scanLine, 'QR code'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "We're moving things around.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Text(
                "See where to share and link",
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
              const SizedBox(height: 20),
              _menuItem(Icons.star_border, 'Add to favourites'),
              _menuItem(Icons.person_remove_alt_1, 'Unfollow'),
              _menuItem(Icons.info_outline, "Why you're seeing this post"),
              _menuItem(Icons.visibility_off, 'Hide'),
              _menuItem(Icons.info, 'About this account'),
              ListTile(
                leading: const Icon(Icons.report, color: Colors.red),
                title: const Text(
                  'Report',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _optionIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[800],
          radius: 28,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _menuItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {},
    );
  }
}
