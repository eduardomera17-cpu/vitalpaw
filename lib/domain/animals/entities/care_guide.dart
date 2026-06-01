// lib/domain/animals/entities/care_guide.dart
// Ficha de cuidados básicos por especie — contenido estático
// que se muestra en la pantalla de detalle del animal.

import 'animal_listing.dart';

class CareGuide {
  final AnimalSpecies species;
  final String title;
  final List<CareSection> sections;

  const CareGuide({
    required this.species,
    required this.title,
    required this.sections,
  });
}

class CareSection {
  final String icon;
  final String title;
  final String content;

  const CareSection({
    required this.icon,
    required this.title,
    required this.content,
  });
}

// Guías estáticas — no requieren Firestore ni Drift
class CareGuideData {
  static const Map<AnimalSpecies, CareGuide> guides = {
    AnimalSpecies.dog: CareGuide(
      species: AnimalSpecies.dog,
      title: 'Cuidados básicos del perro',
      sections: [
        CareSection(
          icon: '🍖',
          title: 'Alimentación',
          content: 'Proporciona alimento balanceado 2-3 veces al día '
              'según su tamaño. Asegura agua fresca siempre disponible. '
              'Evita huesos cocidos, chocolate, uvas y cebollas.',
        ),
        CareSection(
          icon: '🚿',
          title: 'Higiene y grooming',
          content: 'Baño cada 4-6 semanas. Cepilla su pelaje 2-3 veces '
              'por semana. Corta las uñas mensualmente y limpia sus '
              'orejas con regularidad.',
        ),
        CareSection(
          icon: '🏃',
          title: 'Ejercicio',
          content: 'Mínimo 30-60 minutos de actividad física diaria. '
              'Paseos, juegos y socialización con otros perros son '
              'fundamentales para su bienestar mental.',
        ),
        CareSection(
          icon: '💉',
          title: 'Salud y vacunas',
          content: 'Vacuna antirrábica, moquillo, hepatitis y parvovirus '
              'son obligatorias. Desparasitación cada 3 meses. '
              'Visita al veterinario al menos una vez al año.',
        ),
        CareSection(
          icon: '🏠',
          title: 'Ambiente',
          content: 'Espacio seguro para dormir, alejado de corrientes '
              'de aire. Juguetes para estimulación mental. '
              'Nunca lo dejes solo más de 8 horas seguidas.',
        ),
      ],
    ),

    AnimalSpecies.cat: CareGuide(
      species: AnimalSpecies.cat,
      title: 'Cuidados básicos del gato',
      sections: [
        CareSection(
          icon: '🐟',
          title: 'Alimentación',
          content: 'Mezcla de alimento húmedo y seco de calidad. '
              'Agua siempre disponible — prefieren fuentes de agua '
              'en movimiento. Evita leche de vaca y pescado en exceso.',
        ),
        CareSection(
          icon: '🧹',
          title: 'Bandeja sanitaria',
          content: 'Limpieza diaria de la bandeja. Una caja por gato '
              'más una extra. Ubícalas lejos de su zona de comida. '
              'Cambia el sustrato completamente cada semana.',
        ),
        CareSection(
          icon: '🎯',
          title: 'Enriquecimiento',
          content: 'Rascadores, torres de escalada y juguetes '
              'interactivos. Dedica al menos 15 min diarios '
              'a jugar con él. Estimulación mental previene '
              'conductas destructivas.',
        ),
        CareSection(
          icon: '💉',
          title: 'Salud y vacunas',
          content: 'Vacuna triple felina (rinotraqueítis, calicivirus, '
              'panleucopenia) anual. Desparasitación cada 3 meses. '
              'Castración recomendada para reducir conductas no deseadas.',
        ),
      ],
    ),

    AnimalSpecies.bird: CareGuide(
      species: AnimalSpecies.bird,
      title: 'Cuidados básicos de aves',
      sections: [
        CareSection(
          icon: '🌿',
          title: 'Alimentación',
          content: 'Mezcla de semillas específica para la especie, '
              'frutas frescas y verduras. Evita aguacate, chocolate '
              'y sal. Cambiar comida y agua a diario.',
        ),
        CareSection(
          icon: '🏠',
          title: 'Jaula y ambiente',
          content: 'Jaula amplia con espacio para volar de lado a lado. '
              'Varios perchas de diferentes grosores. Ubica lejos '
              'de corrientes de aire y humos de cocina.',
        ),
        CareSection(
          icon: '💬',
          title: 'Socialización',
          content: 'Las aves son sociables y necesitan interacción diaria. '
              'Habla con ellas, déjalas salir de la jaula con '
              'supervisión. Algunas especies necesitan compañía de '
              'otro ejemplar.',
        ),
      ],
    ),

    AnimalSpecies.rabbit: CareGuide(
      species: AnimalSpecies.rabbit,
      title: 'Cuidados básicos del conejo',
      sections: [
        CareSection(
          icon: '🥬',
          title: 'Alimentación',
          content: 'Heno ilimitado (80% de su dieta), pellets de calidad '
              'y vegetales frescos (hojas verdes, zanahoria con '
              'moderación). Nunca lechugas iceberg ni aguacate.',
        ),
        CareSection(
          icon: '🏃',
          title: 'Ejercicio',
          content: 'Necesita al menos 3 horas fuera de la jaula al día. '
              'Espacio seguro sin cables expuestos. Son activos al '
              'amanecer y atardecer.',
        ),
        CareSection(
          icon: '✂️',
          title: 'Higiene',
          content: 'Nunca bañarlos con agua — se limpian solos. '
              'Cepillado semanal para evitar bolas de pelo. '
              'Corta las uñas cada 6-8 semanas.',
        ),
      ],
    ),
  };

  static CareGuide? forSpecies(AnimalSpecies species) =>
      guides[species];
}
