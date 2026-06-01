import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/sidebar_nav.dart';
import 'widgets/top_bar.dart';
import 'tabs/home_tab.dart';
import 'tabs/agenda_tab.dart';
import 'tabs/inventory_tab.dart';
import 'tabs/finance_tab.dart';
import 'tabs/crm_tab.dart';

class DashboardTabNotifier extends Notifier<int> {
  @override
  int build() => 0;
  void setTab(int index) => state = index;
}

final dashboardTabProvider = NotifierProvider<DashboardTabNotifier, int>(DashboardTabNotifier.new);

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(dashboardTabProvider);

    // Responsive layout check
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    final tabs = const [
      HomeTab(),
      AgendaTab(),
      InventoryTab(),
      FinanceTab(),
      CrmTab(),
    ];

    final titles = const [
      'Panel Principal',
      'Agenda y Clínica',
      'Inventario y Adopciones',
      'Finanzas y Facturación',
      'CRM y Usuarios'
    ];

    final sidebar = SidebarNav(
      selectedIndex: selectedIndex,
      onItemSelected: (index) {
        ref.read(dashboardTabProvider.notifier).setTab(index);
        if (!isDesktop) {
          Navigator.of(context).pop(); // Close drawer on mobile
        }
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE0E3E5), // Surface variant
      appBar: isDesktop
          ? null
          : AppBar(
              backgroundColor: const Color(0xFFF7F9FB),
              foregroundColor: const Color(0xFF191C1E),
              title: Text(
                titles[selectedIndex],
                style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      drawer: isDesktop ? null : Drawer(child: sidebar),
      body: Row(
        children: [
          if (isDesktop) sidebar,
          Expanded(
            child: Column(
              children: [
                if (isDesktop) TopBar(title: titles[selectedIndex]),
                Expanded(
                  child: Container(
                    color: const Color(0xFFF7F9FB), // Main background
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: tabs[selectedIndex],
                    ),
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
