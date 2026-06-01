import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;

  const TopBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F9FB), // Surface color
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF191C1E),
            ),
          ),
          const Spacer(),
          // Sync Status Indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9), // Functional Mint background approx
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.check_circle, color: Color(0xFF2E7D32), size: 16),
                SizedBox(width: 6),
                Text(
                  'Sincronizado',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B5E20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Notification Icon
          IconButton(
            icon: const Badge(
              child: Icon(Icons.notifications_none, color: Color(0xFF3E4850)),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          // New Appointment Action
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00A8E8), // Primary Container
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // rounded-md
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            icon: const Icon(Icons.add, size: 20),
            label: const Text(
              'Nueva Cita',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
