import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SidebarNav extends ConsumerWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SidebarNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 24),
          // Logo / Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Icon(Icons.pets, color: const Color(0xFF00A8E8), size: 32),
                const SizedBox(width: 12),
                Text(
                  'VitalPaw',
                  style: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF191C1E),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _NavItem(
                  icon: Icons.dashboard_outlined,
                  activeIcon: Icons.dashboard,
                  label: 'Inicio',
                  isSelected: selectedIndex == 0,
                  onTap: () => onItemSelected(0),
                ),
                _NavItem(
                  icon: Icons.calendar_month_outlined,
                  activeIcon: Icons.calendar_month,
                  label: 'Agenda Clínica',
                  isSelected: selectedIndex == 1,
                  onTap: () => onItemSelected(1),
                ),
                _NavItem(
                  icon: Icons.inventory_2_outlined,
                  activeIcon: Icons.inventory_2,
                  label: 'Inventario',
                  isSelected: selectedIndex == 2,
                  onTap: () => onItemSelected(2),
                ),
                _NavItem(
                  icon: Icons.attach_money_outlined,
                  activeIcon: Icons.attach_money,
                  label: 'Finanzas',
                  isSelected: selectedIndex == 3,
                  onTap: () => onItemSelected(3),
                ),
                _NavItem(
                  icon: Icons.people_outline,
                  activeIcon: Icons.people,
                  label: 'CRM',
                  isSelected: selectedIndex == 4,
                  onTap: () => onItemSelected(4),
                ),
              ],
            ),
          ),
          // User profile at bottom
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFF00A8E8),
                  child: Text('Dr', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dr. Veterinario',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Admin',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? const Color(0xFF00658D) : const Color(0xFF3E4850);
    final bgColor = isSelected ? const Color(0xFFC6E7FF) : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.0), // rounded-md
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Row(
              children: [
                Icon(isSelected ? activeIcon : icon, color: color, size: 24),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
