# CC105 Live Demo Script — Atomic Design in Flutter

A ~10–12 minute walkthrough of `atomic_design_demo`, moving bottom-up through
the 5 Atomic Design levels using one running example: a mini shop screen.

Run it first: `flutter run` (keep hot reload ready throughout).

---

## 1. Atoms (~2 min)
Open [`lib/ui/atoms/app_button.dart`](lib/ui/atoms/app_button.dart).

- Point out the header comment: pure presentation, zero logic, zero state.
- It's just `label`, `onPressed`, `color` in → a `Text`-wrapped button out.
- Briefly flash `app_text.dart` and `app_icon.dart` — same story: props in, UI out.

## 2. Molecules (~2 min)
Open [`lib/ui/molecules/search_bar.dart`](lib/ui/molecules/search_bar.dart).

- Now it composes 2 atoms (`AppIcon` + a `TextField`) for one job: searching.
- It's `StatefulWidget`, but only for local UI state (the clear button) —
  no API call, no product data.

## 3. Organisms (~2 min)
Open [`lib/ui/organisms/product_card.dart`](lib/ui/organisms/product_card.dart).

- This is a "real" recognizable component now — a shop-shelf product card.
- It takes a `Product` and an `onAddToCart` callback; it never fetches data
  itself — that rule keeps organisms reusable.

## 4. Templates (~2 min)
Open [`lib/ui/templates/product_list_template.dart`](lib/ui/templates/product_list_template.dart).

- Layout skeleton only: an `AppBar` and a `List<Widget>` in, a `GridView`
  (or empty-state message) out.
- **Live proof:** in `home_page.dart`, temporarily replace
  `children: _mockProducts.map(...).toList()` with `children: const []` and
  hot-reload. The template still renders fine — an empty grid, not a crash —
  because it never knew what a "real" product was to begin with. Revert after.

## 5. Pages (~2 min)
Open [`lib/ui/pages/home_page.dart`](lib/ui/pages/home_page.dart).

- Point out `_mockProducts` — this is the **only** file in the whole app
  holding the mock data list.
- It wires that data into `ProductListTemplate` and `ProductCard` — nothing
  below this layer knows or cares where the data came from.

## 6. The payoff — change once, propagate everywhere (~2 min)
Open `lib/ui/atoms/app_button.dart` and change the button color, e.g.:

```dart
backgroundColor: color ?? Colors.orange,
```

Hot-reload. Every "Add to cart" button across all 6 product cards updates
at once — because they all share the one `AppButton` atom.

## Closing prompt for students
- "Which file would you edit to change **every** button in the app?"
  → `lib/ui/atoms/app_button.dart`
- "Which file would you edit to change **just** the checkout button?"
  → Only that one call site (e.g. inside `product_card.dart` or wherever the
  checkout button is instantiated) — pass a different `color`/`label` prop,
  without touching the atom itself.
