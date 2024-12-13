import 'dart:ui';
import 'package:flutter/material.dart';

class BottomMenuWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const BottomMenuWidget({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 98, 98, 98).withOpacity(0.9),
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomMenuItem(
              icon: Icons.home,
              isSelected: currentIndex == 0,
              onTap: () => onItemSelected(0),
            ),
            _BottomMenuItem(
              icon: Icons.playlist_add,
              isSelected: currentIndex == 1,
              onTap: () => onItemSelected(1),
            ),
            _BottomMenuItem(
              icon: Icons.music_note,
              isSelected: currentIndex == 2,
              onTap: () => onItemSelected(2),
            ),
            _BottomMenuItem(
              icon: Icons.favorite,
              isSelected: currentIndex == 3,
              onTap: () => onItemSelected(3),
            ),
            _BottomMenuItem(
              icon: Icons.person,
              isSelected: currentIndex == 4,
              onTap: () => onItemSelected(4),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomMenuItem extends StatelessWidget {
  final IconData icon;

  final bool isSelected;
  final VoidCallback onTap;

  const _BottomMenuItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color.fromARGB(255, 255, 97, 48)
                : const Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
