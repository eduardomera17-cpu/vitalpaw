---
name: VitalPaw Professional
colors:
  surface: '#f7f9fb'
  surface-dim: '#d8dadc'
  surface-bright: '#f7f9fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f6'
  surface-container: '#eceef0'
  surface-container-high: '#e6e8ea'
  surface-container-highest: '#e0e3e5'
  on-surface: '#191c1e'
  on-surface-variant: '#3e4850'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#6e7881'
  outline-variant: '#bdc8d1'
  surface-tint: '#00658d'
  primary: '#00658d'
  on-primary: '#ffffff'
  primary-container: '#00a8e8'
  on-primary-container: '#003952'
  inverse-primary: '#83cfff'
  secondary: '#895100'
  on-secondary: '#ffffff'
  secondary-container: '#fd9d1a'
  on-secondary-container: '#663b00'
  tertiary: '#006a62'
  on-tertiary: '#ffffff'
  tertiary-container: '#00b0a3'
  on-tertiary-container: '#003c37'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#c6e7ff'
  primary-fixed-dim: '#83cfff'
  on-primary-fixed: '#001e2d'
  on-primary-fixed-variant: '#004c6b'
  secondary-fixed: '#ffdcbc'
  secondary-fixed-dim: '#ffb86b'
  on-secondary-fixed: '#2c1700'
  on-secondary-fixed-variant: '#683d00'
  tertiary-fixed: '#70f8e8'
  tertiary-fixed-dim: '#4fdbcc'
  on-tertiary-fixed: '#00201d'
  on-tertiary-fixed-variant: '#005049'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  display-lg:
    fontFamily: Quicksand
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Quicksand
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: Quicksand
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  title-lg:
    fontFamily: Quicksand
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.5px
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 10px
    fontWeight: '700'
    lineHeight: 12px
    letterSpacing: 1px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  unit: 8px
  container-padding-mobile: 16px
  container-padding-desktop: 32px
  gutter: 16px
  card-gap: 20px
  section-margin: 40px
---

## Brand & Style
The design system is engineered for a dual-purpose environment: clinical precision for veterinary care and high-energy engagement for retail. The brand personality is **Professional, Caring, and Energetic**. It balances the sterile reliability of a medical application with the warmth of a pet-focused community.

The visual style is a **Modern-Tactile** evolution of Material Design 3. It utilizes generous whitespace, soft depth through multi-layered shadows, and a distinctively rounded geometry to reduce visual tension. The goal is to evoke a sense of "calm expertise"—where complex clinical data feels accessible and pet ownership feels joyful.

## Colors
The palette is rooted in 'Vitality Blue' (#00A8E8), chosen for its association with cleanliness and professional health services. 'Sunny Orange' (#FF9F1C) serves as the primary action color for commerce and engagement, creating a high-contrast relationship that guides the eye toward conversion points.

- **Primary (Pet Blue):** Used for clinical headers, primary navigation, and health-related status.
- **Secondary (Sunny Orange):** Reserved for "Add to Cart," "Book Now," and promotional badges.
- **Functional Mint:** A soft, desaturated green used exclusively for 'Synced' or 'Healthy' states to ensure it doesn't compete with primary actions.
- **Surface Strategy:** We use a 'Paper' metaphor. The base background is a cool off-white (`#F8FAFC`), while interactive elements sit on pure white (`#FFFFFF`) cards to create a clear "stacking" logic.

## Typography
This design system utilizes a tiered typographic approach. **Quicksand** is used for all headlines and titles; its rounded terminals reinforce the friendly, approachable nature of the brand. For long-form clinical data and UI labels, **Plus Jakarta Sans** provides superior legibility and a more professional, systematic feel.

- **Scale:** High contrast between headlines and body text to ensure clear information hierarchy in data-heavy views.
- **Weight:** Use SemiBold (600) for interactive labels and Bold (700) for brand-level headers. Avoid weights below 400 to maintain accessibility against the off-white background.

## Layout & Spacing
The layout follows a **8px soft-grid system**. All margins, paddings, and component heights should be multiples of 8 to ensure visual rhythm.

- **Grid:** A 12-column fluid grid for desktop and a 4-column fluid grid for mobile.
- **Margins:** Mobile views use a strict 16px gutter on the outer edges. Desktop views expand to 32px or a max-width container of 1280px.
- **Density:** Clinical records use "Comfortable" vertical spacing (12px - 16px between items) to prevent information density from becoming overwhelming for pet owners.

## Elevation & Depth
Depth is signaled through **Tonal Elevation** and **Ambient Shadows**. This design system avoids harsh black shadows in favor of tinted shadows that use the Primary or Neutral-Dark colors as a base.

- **Level 0 (Base):** Off-white background (`#F8FAFC`).
- **Level 1 (Cards):** Pure white surface with a `4px` blur, `2px` Y-offset shadow at 5% opacity. Used for product grids and list items.
- **Level 2 (Interactive):** Pure white surface with a `12px` blur, `6px` Y-offset shadow at 8% opacity. Used for hovered cards and active pet profiles.
- **Level 3 (Modals):** Pure white surface with a `24px` blur, `12px` Y-offset shadow at 12% opacity.

## Shapes
In line with the friendly brand identity, the design system utilizes a high degree of roundedness.

- **Standard Elements:** 8px (`rounded-md`) for buttons and input fields.
- **Containers:** 16px (`rounded-lg`) for Pet Profile cards and Clinical Record entries.
- **Large Surfaces:** 24px (`rounded-xl`) for main dashboard containers and modal sheets.
- **Avatars:** Always circular (50% radius) to differentiate pet/user profiles from interactive UI components.

## Components

### Sync Status Indicators
- **Synced:** A small circular badge with the functional Mint Green background and a subtle checkmark icon.
- **Pending:** An Amber-tinted pill with a "Syncing..." label in `label-sm` typography. 
- **Offline Mode:** When offline, a persistent thin bar appears at the top of the viewport in a light gray, indicating "Local Mode - Changes will sync later."

### Pet Profile Cards
Large-format cards featuring a circular pet avatar on the left, `title-lg` for the name, and `label-md` tags for species/age. Use a subtle stroke (`1px solid #E2E8F0`) to define the card boundary against the white surface.

### Clinical Record Timeline
A vertical line (2px, dashed, Primary Blue) connecting circular icons. Each entry is a white card with a "Date" label in the top right corner. Use icons to categorize entries (e.g., a syringe for vaccinations, a heart for checkups).

### Product Grid Items
Clean white cards with a fixed-ratio image container (1:1). Price is displayed in `title-lg` using the Secondary Orange to emphasize the marketplace aspect. The "Add" button is a floating action button (FAB) style '+' in the bottom right corner of the card.

### Navigation Markers
Role-based navigation uses color-coded underlines or icons. "Provider" roles see clinical blue accents, while "Owner" roles see energetic orange accents in the bottom navigation bar or sidebar.