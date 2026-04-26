# Easy 5e Sheet — Owlbear Rodeo Extension

A live D&D 5e character sheet that lives inside your Owlbear Rodeo
room. Pairs with the full character builder at
[easydnd5e.app](https://easydnd5e.app) so the same character you
build in the browser shows up at the table — HP, slots, dice, the
lot.

## Install (one-step)

1. Open your Owlbear Rodeo room.
2. Click the puzzle-piece icon → **Settings → Extensions**.
3. Paste this URL into "Install Extension":

   ```
   https://easydnd5e.app/obr/manifest.json
   ```

4. The Easy 5e Sheet popover icon appears in your room toolbar.
   Click it to open the live sheet.

That's it — no account, no install on your machine, no permissions
prompt beyond what OBR already shows.

## What it does

- **Full character builder** at easydnd5e.app — race, class,
  multiclass, subclass, equipment, spells. All rules verified
  against [dnd5e.wikidot.com](https://dnd5e.wikidot.com).
- **Live play panel** inside OBR:
  - HP / AC / initiative with token sync — change HP on the sheet,
    the linked token updates instantly.
  - **Dice+ integration** — every roll is sent to the Dice+ extension
    so the 3D dice physics animation plays in the scene for the whole
    party. The panel itself never rolls dice locally and never spams
    a duplicate text feed (Dice+ owns the roll history).
  - Spell slot tracker, sorcery points, ki, pact slots, mystic
    arcanum 1/LR, Lucky resource.
  - Advantage / disadvantage toggle for the next d20.
  - Death save tracker.
  - Concentration save reminder when you take damage holding a
    spell.
- **Inventory** with coins, weight, and material-component
  auto-consume on cast (Revivify diamond, Stoneskin diamond
  dust, etc.).
- **Reactive ability hints** — War Caster, Mage Slayer, Sentinel,
  and similar feats surface as in-context tooltips.
- **Blood Hunter (Critical Role 2020 revised)** — full class with
  4 Orders (Ghostslayer, Lycan, Mutant, Profane Soul). Dedicated
  panel section: Crimson Rite picker, Blood Maledict counter,
  Hemocraft die info, Mutagen toggles (Mutant), patron picker
  (Profane Soul), Lycan Hybrid Transformation toggle, Order-
  granted curses with badges. All wikidot-verified.
- **Multi-source spellcasting** — multiclass casters with two
  different spellcasting abilities (e.g. Cleric WIS + Wizard INT)
  see one row per source with that source's own DC, attack, and
  ability — no more rolling wizard saves with cleric DC by mistake.

## Screenshots

![Actions tab — HP, AC, Init, Sorcery Points, custom roll, trackers](./screenshots/01-actions.png)
![Abilities tab — checks, saves, full skill list](./screenshots/02-abilities.png)
![Spells tab — spell save DC, slot pips, prepared spells with per-slot cast buttons](./screenshots/03-spells.png)
![Items tab — coins, weight, weapons, gear](./screenshots/04-items.png)

(The previous "Feed" tab screenshot was retired in 0.3.0 — Dice+
now owns roll history, so the panel no longer renders a duplicate
in-iframe feed.)

## What's in this repo

This repo contains **only** the public artifacts needed to
distribute and document the extension:

- [`manifest.json`](./manifest.json) — the OBR extension manifest.
- `README.md` — this file.
- `LICENSE` — MIT for everything in this repo.
- `screenshots/` — promotional images.

The character builder itself (the engine, spell catalog, rules
data, UI components for the full builder) is a separate proprietary
codebase hosted at easydnd5e.app. The popover URL loads that site
in an iframe — that's where all the gameplay logic actually runs.

## Privacy

- The extension does not phone home. All character state is stored
  in the player's browser (`localStorage`).
- Dice rolls and HP changes broadcast to the OBR room via the OBR
  SDK's room-scoped broadcast channel — they do not leave the room.
- No analytics, no tracking pixels, no third-party scripts in the
  popover bundle.

## Versioning

The extension version is tracked in `manifest.json`. OBR caches the
manifest by version string, so a bump forces a refetch on the next
room open.

- `0.1.0` — Initial release
- `0.2.x` — Comprehensive D&D rules audit, live HP/init token sync,
  inventory with coins/weight, autoSource badges, reactive feat
  hints, multiclass header, OBR-iframe-safe dialogs.
- `0.3.0` — Blood Hunter class (Critical Role 2020 revised) with 4
  Orders + Crimson Rite damage rider + Mutagen ASI engine + dedicated
  panel section. Multi-source spell DC/attack display for multiclass
  casters with mixed abilities. 64 new DMG magic items (90 total)
  wikidot-verified. Dice+ compliance: panel no longer rolls its own
  dice — every roll routes to Dice+ for 3D scene physics, in-iframe
  Feed tab removed (Dice+ owns roll history). Profane Soul pact slot
  table corrected (was using Warlock's by mistake), Hemocraft INT/WIS
  picker, Lycan Hybrid Transformation toggle, Order-granted Blood
  Curse auto-display.
- `0.3.1` — Short Rest / Long Rest buttons are now visible on every
  panel tab (previously they were tucked inside the Spells tab, so
  non-caster characters — Barbarian, Fighter, Lycan/Mutant Blood
  Hunter — couldn't access them). Moved to the global panel area
  alongside Class Resources.
- `0.3.2` — Community bug fixes from the Discord:
  Plane Shift: Kaladesh dwarf race added (CON +2 / WIS +1 with Dwarven
  Toughness + Artisan's Expertise, wikidot-verified). Tool proficiency
  picker now stacks class + background grants instead of overwriting
  ("Guild Artisan + Artificer" gives 2 separate picks). Replicate
  Magic Item infusion picker now lists the TCoE replicable items table
  by tier (level 2 / 6 / 10 / 14) with item descriptions, instead of
  showing the player's inventory. Other infusion item dropdowns now
  flag unequipped items as "(not equipped)" with a warning that the
  bonus only applies while worn — explains why some players reported
  Enhanced Defense not "working." Artificer infusion +1→+2 scaling
  now correctly uses the artificer slice (matters for multiclass
  artificer builds). Arcane Propulsion Armor adds the +5 ft speed.
  Helm of Awareness shows "Initiative (ADV)" on the panel button.
  Stoneskin's diamond dust is now flagged consumed; non-consumed
  spell material components are now visible in the panel as an "M"
  badge (previously they were hidden unless consumed).
- `0.3.5` — Wikidot expert deep audit (Sonnet subagent, 14 sınıf × L1-L20):
  • Spiritual Weapon upcast formula off-by-one düzeltildi (L3 slot artık 2d8,
    L5 slot 3d8 — RAW: "1d8 her 2 slot 2nd üzeri").
  • Cleric Disciple of Life L1: heal +(2 + spell level) artık otomatik
    OBR heal formülüne ekleniyor.
  • Cleric Blessed Healer L6: başkasını iyileştirince self-heal +(2 + lvl)
    notify olarak görünüyor.
  • Cleric Divine Strike L8 (Life/Forge/Nature/Tempest/Trickery/War/Death/
    Twilight/Order/Peace/Grave): silah saldırılarına +1d8 (L14'te +2d8)
    domain-specific damage type rider — composeWeaponDamage'a eklendi.
  • Paladin L10 Aura of Courage: derived.hasAuraOfCourage flag (10 ft
    içinde fear immune badge).
  • Knowledge Cleric L1: subclass skill picks (Arcana/History/Nature/
    Religion arasından seçilen 2 skill) artık otomatik expertise alıyor
    (RAW: "doubled prof bonus" — ayrı pick gerektirmiyor).
  • Artificer L7 Flash of Genius: OBR resource tracker (INT mod uses/LR).
  • Artificer L20 Soul of Artifice: derived.saveMiscBonus'a +1/aktif
    infusion eklendi (RAW: +1 per attuned magic item proxy).
  • Rogue L20 Stroke of Luck: OBR resource tracker (1 use/SR), shortRest
    action'a 'stroke-of-luck' reset eklendi.
  • Warlock Lifedrinker invocation (L12+ Pact of Blade): pact weapon
    saldırılarına +CHA mod necrotic damage rider (min +1).
- `0.3.4` — Deep audit fixes (2 paralel Sonnet rule-consistency-verifier
  subagent çıkarımı):
  • Blood Hunter Fighting Style: data + LevelsStep `FightingStyleCard`
    body düzeltildi — gate önce tetikliyordu ama branch yokmuş, picker
    boş kalıyordu. Şimdi 4 stil seçilebilir (Archery / Dueling / Great
    Weapon Fighting / Two-Weapon Fighting).
  • Race Bonus Language picker eklendi — Half-Elf, High Elf Descent,
    Custom Lineage, Locathah artık ekstra dilini seçebilir (önceden
    `bonusLanguages` field'ı vardı ama UI hiç render etmiyordu).
  • Half-Elf SCAG subraces (Wood/Drow/Aquatic/Weapons descent) artık
    Skill Versatility picker'ı göstermiyor — RAW: SCAG p.116 SCAG
    subraces explicitly replace Skill Versatility.
  • Autognome Specialized Design 2 tool seçimi artık picker'da görünüyor
    (data'da trait vardı ama `toolChoices` field'ı yoktu).
  • Barbarian L7 Feral Instinct: inisiyatife avantaj artık derived
    state'e taşınıyor — OBR panelde "Initiative (ADV)" görünüyor.
  • Sorcerer L20 Sorcerous Restoration: kısa dinlenmede 4 sorcery point
    geri kazanma artık `shortRest` action'da uygulanıyor.
  • Persist version 36 → 37 (yeni `raceLanguageChoices` field'ı için).
- `0.3.3` — Blood Hunter Fighting Style fix: at level 2 the picker now
  shows the four wikidot-listed options (Archery, Dueling, Great
  Weapon Fighting, Two-Weapon Fighting). The picker had the right gate
  but the underlying Fighting Style catalog was missing 'bloodhunter'
  in its eligibility lists, so the dropdown was empty. The OBR weapon
  panel now correctly applies these damage/attack modifiers for Blood
  Hunters (e.g. Archery +2 ranged atk, Dueling +2 melee dmg, Great
  Weapon Fighting reroll-1s on two-handed). Also expanded the test
  suite to ~4.6M assertions across 7 test layers (engine math, oracle
  data, journey simulation, combat math, persistence round-trip, DOM
  E2E, regression suite) — every assertion wikidot-verified.

## Compatibility

- Owlbear Rodeo 2.x rooms (manifest version 1).
- Tested on Chromium-based browsers (Chrome, Edge, Brave) and
  Firefox 120+.
- Requires a modern browser with `localStorage` and ES2020 support.

## Support

- Bug reports / feature requests: open an issue in this repo.
- General questions: [easydnde@easydnd5e.app](mailto:easydnde@easydnd5e.app)
- D&D rules questions about a specific feature: open an issue with
  a wikidot link to the relevant rule and we'll cross-check.

## License

MIT. See [LICENSE](./LICENSE).

The MIT license covers the manifest and the contents of this repo.
The character builder hosted at easydnd5e.app is a separate
proprietary product and is not covered by this license.
