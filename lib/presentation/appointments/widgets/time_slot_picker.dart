import 'package:flutter/material.dart';

/// Un selector de franjas horarias (Time Slots) para agendar citas.
///
/// Muestra un grid con las horas disponibles en el día.
class TimeSlotPicker extends StatelessWidget {
  final List<String> availableSlots;
  final String? selectedSlot;
  final Function(String) onSlotSelected;

  const TimeSlotPicker({
    super.key,
    required this.availableSlots,
    this.selectedSlot,
    required this.onSlotSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (availableSlots.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No hay horarios disponibles para este día.'),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap:
          true, // Para que pueda estar dentro de un ListView o ScrollView
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: availableSlots.length,
      itemBuilder: (context, index) {
        final slot = availableSlots[index];
        final isSelected = slot == selectedSlot;

        return InkWell(
          onTap: () => onSlotSelected(slot),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              slot,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ),
        );
      },
    );
  }
}
