// scratch_search.dart
import 'dart:io';

void main() {
  final files = {
    'dashboard_inicio/code.html': 'Dashboard Inicio',
    'cl_nica_y_agenda_administrativa/code.html': 'Clínica y Agenda',
    'gesti_n_de_inventario_y_adopci_n/code.html': 'Inventario y Adopción',
    'finanzas_y_facturaci_n/code.html': 'Finanzas y Facturación',
    'administraci_n_de_usuarios_acciones_r_pidas/code.html': 'CRM y Usuarios',
  };

  for (var entry in files.entries) {
    final file = File(entry.key);
    if (!file.existsSync()) {
      print('${entry.value}: Not Found');
      continue;
    }
    final content = file.readAsStringSync();
    
    // Find all titles, main headings, table headers or notable texts
    print('=== ${entry.value} (${entry.key}) ===');
    final regExp = RegExp(r'<h[2-4][^>]*>(.*?)</h[2-4]>', caseSensitive: false, dotAll: true);
    final matches = regExp.allMatches(content);
    for (var m in matches.take(5)) {
      print('  Heading: ${m.group(1)?.replaceAll(RegExp(r'<[^>]*>'), '').trim()}');
    }
    
    // Let's search for some buttons or sections
    final sections = RegExp(r'<!--\s*(.*?)\s*-->').allMatches(content);
    print('  Notable comments/sections:');
    for (var s in sections.take(10)) {
      print('    - ${s.group(1)?.trim()}');
    }
    print('');
  }
}
