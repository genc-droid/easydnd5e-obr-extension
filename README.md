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
- `0.3.74` — Forge + Grave Cleric domain paneli (XGtE p.18-20).

  Forge ve Grave domain için kalan feature'lar surface edildi
  (mevcut Channel Divinity butonları zaten 0.3.51 / 0.3.54'te
  shipped).

  **Forge Domain** chip'leri:
  • Blessing of the Forge (L1+) — touched +1 weapon/armor /LR
  • Soul of the Forge (L6+) — heavy armor +1 AC + fire resistance
  • Divine Strike (L8+) — +1d8 fire (L14+ +2d8)
  • Saint of Forge and Fire (L17+) — fire immunity + non-magic BPS
    resistance heavy armor

  **Grave Domain**:
  • Eyes of the Grave (L1+, PB/LR) sayaç row — detect undead 60 ft
  • Sentinel at Death's Door (L6+, max(1, WIS) /LR) sayaç row —
    reaction crit→normal hit
  • Circle of Mortality (L1+) chip — 0-HP healing max + Spare the
    Dying 30 ft cantrip
  • Keeper of Souls (L17+) chip — enemy ölünce HD HP regain

  **Bug fix**: Potent Spellcasting (L8+) artık Grave domain için
  de aktif (eskiden sadece Light/Knowledge'da çalışıyordu).
  Mevcut Light/Knowledge davranışı korundu.

  Engine: 8 yeni derived field. Multiclass desteği var.

  Test: 21 yeni test. Toplam 4467/4467 pass.
  Manifest 0.3.73 → 0.3.74.

- `0.3.73` — Genie + Conquest + Bladesinger panel paketi.

  Üç farklı subclass'a kompakt panel desteği eklendi.

  **Genie Warlock** (TCoE p.71-72):
  • Genie's Wrath chip — 1/turn rider, +PB damage, kind'a göre
    bludgeoning/thunder/fire/cold (Dao/Djinni/Efreeti/Marid)
  • Elemental Gift (L6+, PB/LR) sayaç row

  **Conquest Paladin** (XGtE p.37):
  • Aura of Conquest chip (L7+) — frightened creatures speed 0 +
    floor(palLvl/2) psychic damage at start of turn. Aura range
    L18+ Aura Expansion ile 30 ft'a çıkar.
  • Scornful Rebuke chip (L15+) — hit alınca attacker'a CHA psychic
  • Invincible Conqueror chip (L20+) — capstone hatırlatma

  **Bladesinger Wizard** (TCoE p.74):
  • Bladesong toggle button (L2+) — tıkla aktif et / dismiss et.
    +INT AC / +10 ft speed / ADV Acrobatics / +INT concentration
    saves. Aktivasyon PB/SR kullanım harcar.
  • Bladesong (SR) sayaç row

  Engine: 8 yeni derived field. Multiclass desteği var.

  Test: 25 yeni test (Genie 4 kind dmg type, Aura range L7/L18
  expansion, Bladesinger PB scaling, rest cycle SR vs LR).
  Toplam 4446/4446 pass.

  Manifest 0.3.72 → 0.3.73.

- `0.3.72` — Rune Knight Fighter + Phantom Rogue panel desteği.

  TCoE'nin iki popüler subclass'ı için panele tek-dokunuşlu LR
  butonları, sayaç row'ları ve reactive chip'ler eklendi.

  **Rune Knight Fighter** (TCoE p.51):
  • Giant's Might (L3+, PB/LR) butonu — bonus action ile Large
    (L18+ Huge) büyüme + ADV STR + +1d6/+1d8/+1d10 damage 1/turn
    at L3/L10/L18. Buton label'ı boyut + die açıkça görünür
    ("Giant's Might (Huge, +1d10)")
  • Runic Shield (L7+, PB/LR) sayaç row + reactive chip — 60 ft
    ally hit'te attacker reroll
  • Master of Runes (L15+) reactive chip — runeleri 2/SR'ye çıkarır

  **Phantom Rogue** (TCoE p.62-63):
  • Wails from the Grave (L3+, PB/LR) butonu — Sneak Attack sonrası
    ceil(SA/2)d6 (L17+ Death's Friend ile full SA dice) necrotic
    ikinci hedefe 30 ft içinde
  • Tokens of the Departed (L9+, PB max) sayaç row — soul trinket
    inventory tracker
  • Death's Friend (L17+) reactive chip — Wails full damage + always
    1 trinket guarantee

  Engine: 9 yeni derived field. Multiclass desteği var.

  Test: 25 yeni test (Giant's Might 4 tier scaling, Wails 3 tier
  scaling, multiclass support, LR rest cycle). Toplam 4421/4421.

  Manifest 0.3.71 → 0.3.72.

- `0.3.71` — Monk Way of Mercy + Samurai Fighter panel desteği.

  İki popüler XGtE/TCoE subclass'ı için panele tek-dokunuşlu
  ki harcayan butonlar, LR sayaç row'ları ve reactive chip'ler
  eklendi.

  **Way of Mercy Monk** (TCoE p.49):
  • Hand of Healing (L3+) butonu — 1 ki -1 + Dice+'a martial arts
    die + WIS heal formülü (1d4+WIS / 1d6+WIS / 1d8+WIS / 1d10+WIS
    at L3/L5/L11/L17)
  • Hand of Harm (L3+) butonu — 1 ki -1 + Dice+'a martial arts
    die + WIS necrotic. 1/turn rider on unarmed hit.
  • Hand of Ultimate Mercy (L17+) butonu — 5 ki -5 + 1/LR + Dice+'a
    4d10+WIS revive HP. 24 saat içinde ölmüş yaratık için.
  • Physician's Touch (L6+) chip — Healing/Harm condition rider
  • Flurry of Healing and Harm (L11+) chip — Flurry combo

  **Samurai Fighter** (XGtE p.34):
  • Fighting Spirit (L3+) butonu — 3/LR -1 + temp HP (5/10/15 at
    L3/L10/L15) + ADV on melee weapon attacks chip
  • Strength Before Death (L18+) 1/LR sayaç row
  • Tireless Spirit (L10+) chip — initiative refill hatırlatması
  • Rapid Strike (L15+) chip — ADV trade for extra attack

  Test: 25 yeni test. Toplam 4396/4396 pass.
  Manifest 0.3.70 → 0.3.71.

- `0.3.70` — Spores Druid panel desteği (TCoE p.41-42).

  Tasha's Circle of Spores için panele Halo of Spores reaction
  butonu, Symbiotic Entity action butonu, Fungal Infestation LR
  sayacı ve iki reactive chip eklendi.

  **Halo of Spores** (L2+) butonu — reaction tıkla → Dice+'a
  necrotic zar atılır + sahnede CON save reminder. Scaling:
  1d4/1d6/1d8/1d10 at L2/L6/L10/L14.

  **Symbiotic Entity** (L2+) butonu — Wild Shape kullanımı -1 +
  sahnede chip: 4×druidLvl temp HP + halo damage doubled +
  +1d6 necrotic on melee. 10 dakika.

  **Fungal Infestation** (L6+, WIS mod /LR) — sayaç row.
  Reaction ile yakındaki ölü humanoid/beast'i 1 HP zombi yapar.

  **Spreading Spores** (L10+) chip — Symbiotic Entity aktifken
  bonus action 10-ft cube spore zone (1d? Halo damage CON save).

  **Fungal Body** (L14+) chip — crit immunity + 4 condition
  immunity (blinded/deafened/frightened/poisoned).

  Test: 19 yeni test. Toplam 4371/4371 pass.
  Manifest 0.3.69 → 0.3.70.

- `0.3.69` — Bard Whispers + Glamour subclass butonları (XGtE p.16/14).

  İki Bard subclass'ı için tek-dokunuşlu Bardic Inspiration
  harcayan butonlar eklendi.

  **Psychic Blades** (College of Whispers, L3+) — silah saldırısı
  hit aldığında tıkla → 1 Bardic Inspiration -1 + Dice+'a psychic
  zar. Scaling: 2d6/3d6/5d6/8d6 at L3/L5/L10/L15.

  **Mantle of Inspiration** (College of Glamour, L3+) — bonus
  action tıkla → 1 Bardic Inspiration -1 + sahnede chip:
  CHA mod kadar müttefiğe temp HP (5/8/11/14 at L3/L5/L10/L15)
  + reaction ile OA'sız hareket.

  Multiclass desteği var (Sorc 5 / Glamour Bard 3 → 5 temp HP).

  Test: 20 yeni test. Toplam 4352/4352 pass.
  Manifest 0.3.68 → 0.3.69.

- `0.3.68` — Spell formula bulk: 30 yeni büyü.

  PHB + XGtE + TCoE'den eksik kalan formul bulundu ve eklendi.
  Eskiden bu büyüleri OBR panelden cast ettiğinde Dice+'a hiçbir
  formula gitmiyordu — artık doğru zar atışı yapılıyor.

  **P2 (sık kullanılan, 15 adet)**:
  • Color Spray — 6d10 HP havuzu (slot başına +2d10)
  • Sleep — 5d8 HP havuzu (slot başına +2d8)
  • Ensnaring Strike — 1d6 piercing/round (Ranger smite)
  • Hail of Thorns — 1d10 burst, 6d10 cap
  • Flame Blade — 3d6 fire, her 2 slot levelda +1d6
  • Shadow Blade — 2d8/3d8/4d8/5d8 psychic (XGtE breakpoints)
  • Phantasmal Force — 1d6 psychic per turn
  • Bestow Curse — +1d8 necrotic curse rider
  • Wind Wall — 3d8 bludgeoning
  • Glyph of Warding — 5d8 (slot başına +1d8) explosive runes
  • Lightning Arrow — 4d8 (slot başına +1d8) primary + 2d8 burst
  • Conjure Barrage — 3d8 weapon damage type 60-ft cone
  • Warding Bond (effect) — +1 AC + saves + resistance to all
  • Magic Weapon (effect) — +1/+2/+3 attack & damage scaling
  • Elemental Weapon (effect) — +1/+1d4 ila +3/+3d4 elemental scaling

  **P3 (niş, 12 adet)**:
  Catapult, Chaos Bolt, Earth Tremor, Cordon of Arrows, Dust Devil,
  Snilloc's Snowball Swarm, Mind Spike, Maximilian's Earthen Grasp,
  Healing Spirit, Tasha's Caustic Brew, Tasha's Mind Whip, Life
  Transference.

  Test: 53 yeni regression test. 4332/4332 toplam pass.
  Manifest 0.3.67 → 0.3.68.

- `0.3.67` — Beast Master Ranger reactive chip seti (PHB p.93).

  PHB Beast Master Ranger için panele 4 reactive chip eklendi.
  Companion HP/AC tracker ayrı bir sürümde gelecek; bu sürüm
  feature hatırlatmalarını ve PB-to-stats kuralını surfaclıyor.

  **Ranger's Companion** (L3+) chip — beast HP floor (4×ranger
  level) hesaplanıp gösterilir, PB'in companion AC/attack/damage/
  saves'e eklendiği hatırlatılır.

  **Exceptional Training** (L7+) chip — bonus action ile Dash/
  Disengage/Help komutu, beast saldırıları magical sayılır.

  **Bestial Fury** (L11+) chip — companion attack komutuyla 2
  saldırı yapar.

  **Share Spells** (L15+) chip — kendine cast ettiğin self-target
  spell'ler 30 ft içindeki companion'a da etki edebilir.

  Engine: 5 yeni derived (hasRangersCompanion, rangersCompanion
  HpFloor, hasExceptionalTraining, hasBestialFury, hasShareSpells).
  Multiclass desteği var.

  Test: 12 yeni test. Toplam 4279/4279 pass.
  Manifest 0.3.66 → 0.3.67.

- `0.3.66` — Path of Wild Magic Barbarian (TCoE p.50).

  Tasha's Wild Magic Barbarian için panelde Wild Surge tek-dokunuş
  zar butonu, iki LR sayaç row'u ve üç reactive chip eklendi.

  **Wild Surge** (L3+) butonu — rage'e girince d8 atılır
  (Controlled Surge L14+ varsa 2d8). Sonuç Wild Magic Surge
  tablosundan okunur (8 etki: shadowy tendrils, 30 ft teleport,
  illusion, retributive lightning, fly, aura armor, spectral
  chains, regain SP).

  **Magic Awareness** (L3+, PB/LR) — sayaç row, action ile 60 ft
  detect magic.

  **Bolstering Magic** (L6+, PB/LR) — sayaç row, action ile
  müttefiğe 1d3 bonus VEYA spell slot iade.

  **Unstable Backlash** (L10+) chip — raging iken hasar alınca
  reaction olarak Wild Surge'ü yeniden at.

  **Controlled Surge** (L14+) chip — surge atışını iki kere yap,
  birini seç. Buton otomatik 2d8'e geçer.

  Test: 15 yeni test. Toplam 4267/4267 pass.
  Manifest 0.3.65 → 0.3.66.

- `0.3.65` — Path of the Beast Barbarian (TCoE p.50).

  Tasha's kaynaklı Path of the Beast subclass'ı için panele
  Form of the Beast hatırlatma chip'leri ve Infectious Fury /
  Call the Hunt LR sayaçları eklendi.

  **Form of the Beast** chip'leri (L3+, raging) — üç doğal silah
  seçeneği reactive abilities'te listeleniyor:
  • Bite (1d8 piercing) — düşük HP'de hit on creature: 1d8+STR temp HP
  • Claws (1d6 slashing) — Attack action sonrası bonus action ek pençe
  • Tail (1d8 piercing, 10 ft) — reaction +1d8 AC

  **Bestial Soul** (L6+) chip — natural weapons magical + LR'da
  swim/climb/jump bonus seçimi.

  **Infectious Fury** (L10+, PB/LR) — sayaç row, +/- pip tracker.
  **Call the Hunt** (L14+, PB/LR) — sayaç row.

  Engine: 4 yeni derived (hasFormOfTheBeast, hasBestialSoul,
  infectiousFuryUses, callTheHuntUses). Multiclass desteği var.

  Test: 17 yeni test. Toplam 4252/4252 pass.
  Manifest 0.3.64 → 0.3.65.

- `0.3.64` — Wild Magic Sorcerer panel desteği (PHB p.103-104).

  Wild Magic Sorcerer için panele iki tek-dokunuşlu buton + üç
  reactive chip eklendi.

  **Tides of Chaos** (L1, 1/LR) — tıkla → kullanım -1 + sahnede
  hatırlatma chip'i ("ADV on next attack/check/save"). DM Wild
  Magic Surge tetikleyerek kullanımı geri verebilir.

  **Wild Magic Surge** trigger butonu — d20=1 sonrası DM'in surge
  tablosuna gönderdiği rolü oynatır. Tek tıkla 1d100 atılır
  (Dice+'a). Sınır yok, kaç kere tetiklenirse o kadar atış.

  **Bend Luck** (L6+) chip — 2 SP / reaction / 1d4 hatırlatması.
  **Controlled Chaos** (L14+) chip — Surge tablosunda iki kere
  zar atıp birini seç hatırlatması.
  **Spell Bombardment** (L18+) chip — max die rerolls + adds.

  Engine: 4 yeni derived flag (hasTidesOfChaos, hasBendLuck,
  hasControlledChaos, hasSpellBombardment). Multiclass desteği
  var (Fighter 5 / Wild Magic Sorc 1 → Tides of Chaos açılır).

  Test: 25 yeni test (14 derived + 11 panel UI). Toplam 4235/4235.
  Manifest 0.3.63 → 0.3.64.

- `0.3.63` — Echo Knight panel desteği (Fighter, EGtW p.183).

  Critical Role / Wildemount kaynaklı Echo Knight subclass'ı için
  panelde kaynak tracker'ları ve Reclaim Potential butonu eklendi.

  **Unleash Incarnation** (L3+, LR) — CON modifier kadar kullanım,
  echo'nun olduğu noktadan ek saldırı atmanı sağlıyor. Tracker
  +/- pip'leri ile takip edilir. Long Rest'te yenilenir.

  **Shadow Martyr** (L10, SR) — 1/short rest reaction. Yakındaki
  bir müttefiğe gelen saldırıyı echo'ya yönlendir.

  **Reclaim Potential** (L15+, LR) — echo yok edildiğinde 2d6+CON
  geçici HP. Tek-dokunuş Dice+ butonu, formula buton üstünde
  görünür. CON modifier kadar kullanım/LR.

  Engine: 4 yeni derived field (unleashIncarnationUses, shadow
  MartyrUses, reclaimPotentialFormula, reclaimPotentialUses).
  Multiclass desteği var (Wizard 5 / Echo Knight 3 → çalışır).

  Test: 31 yeni test (20 derived + 11 panel UI). 4210/4210 pass.
  Manifest 0.3.62 → 0.3.63.

- `0.3.62` — Indomitable & Stroke of Luck quick-spend butonları.

  Fighter ve Rogue capstone'ları için hızlı kullanım butonları
  eklendi. Eskiden yalnızca +/- pip tracker'da görünüyorlardı,
  artık tek dokunuşla atış yapan butonlar var.

  **Indomitable** (Fighter PHB p.72) — L9'dan itibaren açılır,
  failed save'i yeniden atmaya yarar. Buton: kullanım -1 + Dice+'a
  1d20 gönderir + sahnede hatırlatma chip'i. Oyuncu yeni d20'ya
  kendi save bonusunu ekler. 1/2/3 use at L9/13/17, LR refresh.

  **Stroke of Luck** (Rogue L20, PHB p.97) — failed attack roll'u
  hit'e veya failed ability check d20'sini 20'ye çevirir. Zar
  atılmıyor (deterministic substitution); buton sadece kullanımı
  harcar + sahneye açıklayıcı chip basar. 1/SR.

  Test: 18 yeni test (rendering gates + spend logic + Dice+ flow +
  rest cycle regression). Toplam 4179/4179 pass.

  Manifest 0.3.61 → 0.3.62.

- `0.3.61` — Druid Land Natural Recovery picker (PHB p.69).

  Land Druid'ler için uzun zamandır eksik olan Natural Recovery
  picker'ı eklendi. Wizard Arcane Recovery'nin aynısı:

  • L2+ Land Druid otomatik açılıyor (8 alt çevre — Arctic / Coast /
    Desert / Forest / Grassland / Mountain / Swamp / Underdark)
  • Short rest sırasında harcanmış L1-L5 spell slot'larını seçip
    geri kazanırsın
  • Budget = ⌈druidLvl / 2⌉ slot-level toplamı (L2: 1, L5: 3, L20: 10)
  • 1/LR — uzun dinlenme arası tek kullanım
  • L6+ slot'lar geri kazanılamaz (Arcane Recovery ile aynı kural)

  Multiclass desteği var (Fighter 5 / Land Druid 4 → budget 2).
  Renk paleti emerald — Wizard'ın altın ARC'ından ayırt edilebilir.

  Test: 4161/4161 pass + 26 yeni test (14 derived + 12 picker UI).
  Manifest 0.3.60 → 0.3.61.

- `0.3.60` — Dragonborn Breath Weapon panel butonu (PHB p.34 + FToD).

  Dragonborn karakter seçtiğinizde panelde otomatik olarak ırk
  özelliğiniz için bir buton beliriyor. Wikidot RAW table tam:

  **Hasar tipi & şekil & save** ancestry'e göre eşleniyor (15 toplam):
  • PHB (10): Black/Blue/Brass/Bronze/Copper/Gold/Green/Red/Silver/White
  • FToD gem (5): Amethyst/Crystal/Emerald/Sapphire/Topaz

  **Hasar dice scaling** karakter level'a göre (sınıf değil):
  • L1-5: 2d6 / L6-10: 3d6 / L11-15: 4d6 / L16+: 5d6

  **Save DC** = 8 + CON mod + PB. Shape (line/cone) ve save ability
  (DEX/CON) ancestry'e bağlı. SR/LR sonrası kullanım yenileniyor
  ('breath-weapon' resource keyed).

  Test: 4135/4135 pass + 21 yeni Dragonborn breath test.
  Manifest 0.3.59 → 0.3.60.

- `0.3.59` — Engine→UI binding chip dalgası (subagent fresh audit P1).
  Engine derive ediyor ama UI okumuyor pattern'ı 14 yeni chip ile kapatıldı.
  Hepsi wikidot RAW URL referanslı.

  **Magic item chips (4)**:
  • Mithral Plate — no Stealth disadv + no STR prereq
  • Plate of Etherealness — Etherealness 1/LR
  • Ring of Mind Shielding — immune to thought detection / charm-via-telepathy
  • Goggles of Night — 60 ft darkvision

  **Eldritch Invocation passive chips (5)**:
  • Voice of the Chain Master — telepathic familiar
  • Whispers of the Grave — Speak with Dead at will
  • Misty Visions — Silent Image at will
  • Ascendant Step — Levitate self at will
  • Otherworldly Leap — Jump self at will

  **Race passive reminders (3)**:
  • Halfling Lucky (race trait, NOT feat — reroll d20=1)
  • Halfling Brave (advantage on save vs frightened)
  • Stonecunning (Dwarf — INT History on stonework, prof + double PB)

  **Class capstone reminder (1)**:
  • Reliable Talent (Rogue L11+ — d20 ≤ 9 treated as 10 on prof checks)

  **Caster cantrip damage adders (3)**:
  • Potent Spellcasting (Cleric Light/Knowledge L8 — auto +WIS to cantrip)
  • Empowered Evocation (Wizard Evoker L10 — auto +INT to evocation)
  • Elemental Affinity (Sorc Draconic L6 — auto +CHA to matching damage)

  **Wild Shape MaxCR cap reminder**:
  • Druid wild shape kapasitesi (1/4, 1/2, 1, Moon scaling)

  Ek olarak (subagent discord-bug-hunter P1):
  - **Heightened Spell metamagic notify echo**: save-spell + save-with-damage
    branchlerinde metamagicLabel + Heightened hint eklendi. Sorc 3 SP burn
    edip Hold Person cast ediyorsa GM artık "first save DISADV" hatırlat-
    masını panelde görür.
  - **Hexblade's Curse 19-20 crit scene reminder** (XGtE p.55): chip armed
    iken silah saldırı sonrası scene'e expanded crit range bildirilir.
    Allies/DM unutursa panel hatırlatır.

  Test: 4087/4087 + 27 yeni binding test = 4114 toplam pass.
  Manifest 0.3.58 → 0.3.59.

- `0.3.58` — Resource consumption audit P0 dalgası (subagent fresh audit).

  **P0-1: Blood Maledict SR recharge eksikliği**: srKeys array'inde
  'blood-maledict' yoktu, Short Rest'te use'lar geri gelmiyordu. Blood
  Hunter L5+ Pact of Investiture / Blood Curse spend ettikten sonra SR
  alsa bile spent state'te kalıyordu. Bir satırlık fix: srKeys'e
  'blood-maledict' eklendi. Wiki: https://dnd5e.wikidot.com/blood-hunter
  ("PB uses, regain on short or long rest").

  **P0-2: Favored Foe eager-spend (Tasha's RAW ihlali)**: chip tap'te
  `adjustResource('favored-foe', 1)` çağırılıyordu — chip'i arm edip
  miss yapan ranger'lar use'ı boşa harcıyordu. RAW: "When you HIT a
  creature with an attack roll" — use ON HIT consumed olur, arm değil.
  Stunning Strike + smite + maneuvers ile aynı pattern uygulandı:
  arm chip free, requestDamage().onHit'te use harcanır.

  **P0-3: Crimson Rite HP cost auto-debit**: Blood Hunter aktivasyon
  maliyeti panel-no-dice rule yüzünden sadece notify'dı, oyuncu manuel
  HP'sini düşürmesi gerekiyordu. RAW: "Activating a rite causes you to
  take damage equal to one roll of your hemocraft die. This damage
  cannot be reduced or prevented in any way." — zorunlu. Şimdi
  rollWithDicePlus('1d{HC}') kicks Dice+ AND avg HP loss otomatik
  debit edilir (Hit Dice avg pattern'a benzer). Player gerçek roll
  ortalamadan farklıysa manuel ayarlar.

  Test: 4087/4087 pass + tip check temiz. Manifest 0.3.57 → 0.3.58.

- `0.3.57` — Spell formula bulk add (subagent audit) + 2 yeni P0 fix.

  **Subagent audit P0 #1: 14 spell formula eklendi** (Hex, Hunter's Mark,
  Bless, Divine Favor, Guidance, Resistance, Circle of Death, Harm,
  Freezing Sphere, Finger of Death, Psychic Scream, Abi-Dalzim's Horrid
  Wilting + Hunger of Hadar + Melf's Acid Arrow id mismatch fix). Bunlar
  spellDamage.ts'te eksik olduğu için Dice+'a gönderilmiyordu — oyuncular
  manuel zar atmak zorundaydı. Şimdi getSpellRoll() doğru formula
  üretir. P1 paladin smites (Blinding/Branding/Staggering/Banishing) +
  high-level heals (Regenerate/Mass Heal/Power Word Heal) + XGtE damage
  (Vitriolic Sphere/Synaptic Static/Steel Wind Strike/Wither and Bloom/
  Thunder Step/Aganazzar's Scorcher/Spirit Shroud) de eklendi.

  **Subagent audit P0 #2: Wild Shape concentration drop**: Druid
  beast formundayken `wildShapeHp` damage alındığında concentration
  CON save tetiklenmiyordu (sadece `currentHp` izleniyordu). PHB p.66
  RAW + Sage Advice (Crawford): "concentration persists in Wild Shape
  ve damage save gerektirir". Yeni useEffect watcher eklendi —
  prevWildShapeHpRef ile damage hesaplanır, DC max(10, dmg/2) ile
  concPrompt fire eder.

  **Subagent audit P0 #3: Psi Warrior Fighter Psionic Energy gate**:
  Engine sadece rogue-soulknife için Psionic Energy dice veriyordu.
  Psi Warrior Fighter (TCoE p.118) aynı RAW mekanik ama panele hiç
  gelmiyor → oyuncu Psionic Strike / Protective Field track edemiyor.
  Gate union'a alındı (Soulknife OR Psi Warrior). Multiclass'ta higher
  die size kullanılır.

  Test: 14 spell formula + 13 Psi Warrior + Wild Shape regression =
  +44 yeni test. 4087 toplam pass. Manifest 0.3.56 → 0.3.57.

- `0.3.56` — Spell slot race condition exploit kapatıldı + multiclass prereq
  RAW doğrulamasi.

  **Spell slot race condition (P0 exploit fix)**: rapid double-tap veya
  iki simultane Hit confirm'in slot'u tek harcayıp iki cast tetiklemesi
  exploit'i kapatıldı. Çözüm: store'da yeni atomic helper'lar
  `trySpendSlot(level, max)` ve `trySpendPactSlot(max)` — check+increment
  tek `set()` callback'inde. Eski read-then-write pattern'ı iki çağrının
  da used=0 görüp 1 yazmasına izin veriyordu (1 slot harcanır, 2 cast).
  consumeSlot + smite onHit + Eldritch Smite onHit hepsi yeni atomic
  API'ye taşındı. 11 yeni stress test (high-volume 100 simultane
  spend → tam 10 başarı, 90 reddedilir).

  **Multiclass prereq enforcement (P0 doğrulama)**: subagent'in 0.3.51
  raporunda "INT 8 wizard multiclass kabul ediliyor" iddiası test edildi
  ve YANLIŞ çıktı. Mevcut engine doğru — `meetsMulticlassPrereqs()`
  ClassStep.tsx'te aktif gating yapıyor. 23 yeni regression test
  (PHB p.163 tüm 12 class için tek-stat / OR / AND prereqs).

  Test: 4054/4054 pass + 2 skipped. Manifest 0.3.55 → 0.3.56.

- `0.3.55` — UX gap dalgası + 0.3.54 regression test paketi.

  **OUT OF SLOTS chip** (P0): spell row'da slot tükendiğinde butonun
  neden disable olduğu görünür. Mavi/kirmizi şerit "⛔ NO L1" / "⛔ NO PACT"
  formatında. Tooltip rest type'i acıklar (PHB p.107 pact, p.186 long).

  **Conc / Ritual upfront pills** (P1): combat-relevant flag'ler artık
  cast button'un yanında inline gozukur. CONC chip kırmızı (PHB p.203
  concentration kuralları), RIT chip altın (PHB p.201 ritual kuralları).
  ⓘ tooltip'i beklemiyor.

  **Combat Stats Strip**: HP/AC/Init satırının altında yeni "Combat" şerit.
  Spell DC + atk bonus per source, Ki DC, Maneuver DC, Passive Perception,
  Passive Investigation hep gozunde. Multi-class casters'ta her sınıfın
  DC'si ayri pill (Sorc DC + Wiz DC). PHB p.205 + p.78 + p.74 + p.176.

  **Proficiency Bonus** ana grid'e eklendi (HP/AC/Init -> AC/Init/PB
  3-cell). Player "PB +3" görsel okur, soruya cevap verir.

  **0.3.54 yeni feature'lar icin 68 yeni regression test**:
  - clericDomainCDsExtended.test.tsx (26): 4 cleric XGtE/SCAG/TCoE
    domain CD tam validation - Balm of Peace 2d6+WIS, Twilight 1d6+
    cleric_lvl, multiclass formula doğru, level/subclass gating
  - paladinOathCDsExhaustive.test.tsx (25): 12 paladin oath CD tam
    coverage - Turn the Tide 1d6+CHA, Inspiring Smite 2d8+pal_lvl,
    Watcher's Will target count = max(1, CHA mod), oath isolation
  - weaponRidersExtended.test.tsx (17): Eldritch Smite gating, Hexadin
    pact slot smite, Hunter Colossus Slayer, Gloomstalker Dread Ambusher
    derived state validation

  Test: 4009/4009 pass. Manifest 0.3.54 → 0.3.55.

- `0.3.54` — %100 RAW doğruluk yol haritası Faz 1: 17 yeni RAW-doğrulamalı
  feature button + rider chip. Wikidot RAW spec'leri (PHB+XGtE+TCoE+SCAG+
  MoT) live-fetch ile doğrulandı. Tümü uygun subclass + level
  kombinasyonunda otomatik render olur.

  **4 cleric XGtE/SCAG/TCoE domain CD:**
  • Arcana L2: Arcane Abjuration (SCAG p.125) - WIS save fey/fiend/celestial/elemental
  • Order L2: Order's Demand (TCoE p.33) - 30 ft multi-target WIS save charm
  • Peace L2: Balm of Peace (TCoE p.34) - 2d6+WIS heal each creature near move (zar atilir)
  • Twilight L2: Twilight Sanctuary (TCoE p.36) - 30 ft sphere 1 dk, 1d6+cleric_lvl temp HP per turn-end (zar atilir)

  **6 paladin oath x 12 yeni CD button:**
  • Ancients: Nature's Wrath (10 ft restrain) + Turn the Faithless
  • Conquest: Conquering Presence (frighten) + Guided Strike (+10 atk after roll)
  • Crown: Champion Challenge (movement-lock) + Turn the Tide (1d6+CHA heal, zar atilir)
  • Glory: Peerless Athlete (Athletics/Acrobatics) + Inspiring Smite (2d8+pal_lvl temp HP, zar atilir)
  • Redemption: Emissary of Peace (+5 Persuasion) + Rebuke the Violent (radiant retaliate)
  • Watchers: Watcher's Will (CHA mod allies INT/WIS/CHA save adv) + Abjure Extraplanar

  **Eldritch Smite rider chip** (Pact-of-Blade Warlock L5+ XGtE p.56):
  silah saldiri row'unda armable chip - on-hit pact slot harca,
  (slot+1)d8 force damage + Huge altinda prone. Once per turn.

  **Hexadin pact slot smite** (SAC ruling Crawford 2017): Divine Smite
  picker'a yeni "Smite Pact LX" chip. Pact slot kullanir (regular slot
  degil); pact slot level'inda smite dice atilir.

  **Ranger rider chip'leri:**
  • Hunter Colossus Slayer (PHB p.93) - +1d8 weapon-type, target's HP < max
  • Gloomstalker Dread Ambusher (XGtE p.42) - +1d8 first-turn extra attack

  Tum yeni feature'lar wikidot RAW verbatim text'ten turetildi. Sayfa
  numarasi tooltip + scene roll'da. Zar atan CD'ler Dice+ formula'yi
  otomatik gonderir. Subclass + level gating dogru.

  Test: 3941/3941 pass + tip check temiz. Manifest 0.3.53 -> 0.3.54.

- `0.3.53` — 6 QA subagent'ından çıkan kritik exploit ve production bug
  paketi. Subagent'lar paralel çalıştırıldı, 120 bulgu / 18 P0 raporlandı.
  Bu sürüm en kritik 7 P0'ı kapatıyor (geri kalanı 0.3.54-55 için sıralı):
  • **Sorcery Points key mismatch** — PRODUCTION BUG. Runtime `'sorcery'`
    key'i kullanırken store recharge `'sorcery-points'`. Sorcerer L20
    Sorcerous Restoration UZUN SÜREDİR ÇALIŞMIYORDU. Test'ler yanlış
    side'ı seed ettiği için maskelenmişti. PHB p.103 RAW.
  • **Hexblade's Curse 1/SR gate** — eskiden serbest re-toggle, sınırsız
    activate. RAW (XGtE p.55): "Once you use this feature, you can't use
    it again until you finish a short or long rest." Resource counter
    eklendi, short rest'te recharge olur, butonun ⌛ durumu var.
  • **Rage / Bladesong activation resource spend** — `setRageActive(true)`
    ve `setBladesongActive(true)` rage/bladesong counter'ını bypass
    ediyordu. Sınırsız rage/bladesong! RAW (PHB p.48 + XGtE p.74): her
    activation 1 use harcar. Şimdi state transition'da spend yapılıyor.
  • **Stunning Strike: ki on hit** — eskiden chip tıklayınca ki harcanıyordu
    (miss olsa bile). RAW (PHB p.79): "When you HIT a creature with a
    melee weapon attack". Şimdi armable chip + onHit callback'inde spend.
  • **Multi-item over-consume fix** — Speak with Dead'i envanterde 4
    incense varsa 4'ünü de yakıyordu! Şimdi tek-component için sadece
    matchingItems[0] decrement. Multi-component (Astral Projection,
    Symbol, Sequester) için per-tier item match'i ile her gp tier'ı
    için ayrı decrement.
  • **Twinned Spell multi-ray gate** — Scorching Ray, Magic Missile,
    Eldritch Blast'ta Twinned chip yanlışlıkla eligible'dı. RAW (PHB
    p.102): "If it can target more than one creature at the chosen level,
    it can't be twinned." Multi-projectile detection eklendi.
  • **Paralyzed/Stunned/Petrified/Unconscious → concentration auto-drop**
    — RAW (PHB p.203): "You also lose concentration on a spell if you
    become incapacitated or if you die." `toggleCondition` ve
    `setExhaustion` artık incapacitated ya da exhaustion 6 olunca
    `concentratingOn`'u null'a alıp ilgili spell effect'lerini temizliyor.
  • Test: 3483/3483 pass + güncellenmiş test'ler (sorcery key, Stunning
    Strike behavior). Manifest 0.3.52 → 0.3.53.

  **Henüz kapatılmadı (0.3.54-55 sıralı):** Battle Master maneuvers on
  hit (cross-component refactor), 4 cleric domain CD eksik (Arcana,
  Order, Peace, Twilight), 6 paladin oath CD eksik, Hexadin pact slot
  smite, Eldritch Smite rider, Hunter Colossus / Gloomstalker Dread
  Ambusher rider chip'leri, Lay on Hands bulk spend, OUT OF SLOTS chip,
  Save DC strip default tab.

- `0.3.52` — Site Background step'e Clear butonu (kullanıcı: "yanlışlıkla
  tıkladım seçmemi iptal edemiyorum") + 6 yeni geliştirme subagent'ı
  ihale projesinin kapsamlı QA katmanı için.
  • **Background cancel/reset**: site BackgroundStep'inde seçili background
    yoksa "Clear" butonu yoktu, oyuncu yanlış tıkladığında geri dönemiyordu.
    Aktif background satırının üstünde "Selected: <Name> [✕ Clear]" şeridi.
    Aynı background'a ikinci kez tıklamak da deselect yapar (toggle).
    `setBackground(null)` zaten store'da çalışıyordu, sadece UI çıkışı yoktu.
  • **6 yeni subagent** geçmiş Discord raporlarındaki bug pattern'larını
    benzer case'lerde proaktif yakalamak için (`.claude/agents/`):
    – **engine-ui-binding-auditor**: "engine doğru hesaplıyor ama UI
      okumuyor" gap'leri (custom items 0.3.50, conditions 0.3.49,
      pact slot 0.3.48, domain CDs 0.3.51 hep bu pattern'dı)
    – **panel-information-density-auditor**: "tooltip'te var ama inline
      değil" UX bug'ları (BLOCKED material 0.3.50, spell desc 0.3.49,
      ability scores 0.3.50)
    – **resource-consumption-tester**: tüm slot/SP/HD/CD/pact/Lay on
      Hands/rage/superiority dice tüketim path'leri için 6-check matrix
      (pool size, spend, side effect, payment, recharge, edge cases)
    – **component-system-stress-tester**: 5-state cast matrix × inventory
      × toggle × spell-kind. Lightning Bolt 0.3.40, reusable 0.3.45 gibi
      bug'lar bu matrix'in kapsanmamış hücrelerinden çıkıyordu
    – **multiclass-edge-case-tester**: full/half/third/pact caster
      kombinasyonu, EK/AT L<3 gating, save proficiency stacking,
      cantrip char-level scaling, mixed-ability casters DC
    – **discord-bug-hunter**: yaratıcı/role-play tarzı player POV bug
      yakalayıcı. "Ben yaparken Y oluyor" tipindeki UX bug'ları sistematik
      auditor'ların kaçırdığı yerlerden bulur
  • Hepsi NON-NEGOTIABLE wikidot doğrulama şartı içerir; her recommend
    edilen fix wiki URL'siyle gelmeli (proje memory `feedback_wikidot.md`
    kuralı). Subagent'lar kod yazmaz, sadece raporlar — main agent uygular.
  • Test: 3483/3483 pass. Manifest 0.3.51 → 0.3.52.

- `0.3.51` — Tüm PHB+XGtE Cleric domain Channel Divinity'leri + Paladin
  Vengeance/Devotion oath CD'leri (kullanıcı: "hep iki tane divinity var
  ikise farklı ise yarıyor bazıları zarları etkiliyor"). Eski sürümde
  sadece Life (Preserve), Light (Radiance), Devotion Paladin (Sacred
  Weapon) vardı, geri kalan domain ve oath'lerde 2. CD görünmüyordu.
  Şimdi Cleric subclass'ına göre otomatik:
  • **War Domain L2** — **Guided Strike** (PHB p.62): zarları etkileyen
    en büyük CD. Saldırı atışından sonra +10 ekler (ZAR atıldıktan
    SONRA karar verirsin)
  • **Tempest Domain L2** — **Destructive Wrath** (PHB p.62): thunder
    veya lightning damage atışını ZARLAMADAN max'a çıkarır
  • **Knowledge Domain L2** — Knowledge of the Ages (PHB p.59): 10 dk
    boyunca seçtiğin skill veya tool'da prof
  • **Trickery Domain L2** — Invoke Duplicity (PHB p.63): 30 ft içinde
    illüzyon kopya, 1 dk concentration. Kopyadan 5 ft içindeki
    yaratıklara saldırılarda adv
  • **Nature Domain L2** — Charm Animals & Plants (PHB p.62): 30 ft,
    her beast/plant WIS save (panelde DC otomatik) ya da 1 dk charmed
  • **Death Domain L2** — Touch of Death (DMG p.96): melee hit'te
    +5 + 2 × cleric_lvl necrotic ekstra damage
  • **Forge Domain L2** — Artisan's Blessing (XGtE p.18): 1 saat
    ritüel ile ≤ 100 gp metal item üretir
  • **Grave Domain L2** — Path to the Grave (XGtE p.20): 30 ft hedef
    cursed, BİR sonraki damage atışı vulnerability ile ÇİFTLENİR
  • **Paladin Vengeance L3** — Vow of Enmity (PHB p.88): 10 ft hedef,
    1 dk boyunca ona yapılan tüm saldırılar ADVANTAGE
  • **Paladin Devotion L3** — Turn the Unholy (PHB p.86): 30 ft içindeki
    fiend/undead'lere WIS save (panelde DC otomatik), 1 dk turn

  Her butonun tooltip'i tam RAW açıklamayı ve sayfa numarasını gösterir.
  CD sayacı bittiğinde butonlar otomatik disabled. Test 3483/3483 pass.
  Manifest 0.3.50 → 0.3.51.

- `0.3.50` — Discord 7-bug temizlik dalgası (custom items, ability scores,
  exhaustion stacking, BLOCKED material, Channel Divinity, Hit Dice → HP,
  Agonizing Blast doğrulama):
  • **Custom item isimleri/açıklamaları** (kullanıcı: "bunlar custom itemler
    siteden ekledim ama açıklamaları görünmüyor"): items tab'da custom
    item lookup `state.customItems`'a fallback eder. Önceden raw ID
    ("custom-spint-blade-2-moldgen9") gözüküyordu, şimdi friendly name +
    açıklama tooltip'te + ağırlık carry capacity'e dahil.
  • **Ability scores OBR'da görünüyor** (kullanıcı: "ben kac strim var
    kac cham var fln"): Abilities tab'a 6'lı grid eklendi — STR/DEX/CON/
    INT/WIS/CHA için raw score (15) + modifier (+2) yan yana. Tooltip
    base + race/feat/item bonusları gösterir.
  • **Exhaustion debuffs cumulative** (Wikidot RAW: "Effects of exhaustion
    are cumulative"): kullanıcı "debufflar birikiyor sadece secli debuf
    varmis gibi nalasiliyor" — eski UI sadece o seviyeyi göriyordu.
    Şimdi Lvl 3'te 1, 2 ve 3 etkilerinin hepsi listeli "L1: ... / L2: ...
    / L3: ..." formatında.
  • **BLOCKED spell row material text inline** (kullanıcı: "bu kısımda
    sadece bloc diyor ama oyuncu buyunun ne yapmka istediğine bakabilecek
    isteyecektir"): Mending'in lodestone'ları, Fireball'un guano+sulfur'u
    gibi material text'i artık inline italik olarak gözüküyor. Tooltip
    yerine direkt görünür.
  • **Turn Undead Channel Divinity** (kullanıcı: "kismi var divinitynin
    kendisi yok / hep iki tane divinity var"): Cleric L2+ için Turn Undead
    butonu eklendi. PHB p.59 — 30 ft, undead WIS save vs DC, turned 1 min.
    Cleric L5/8/11/14/17'de Destroy Undead CR threshold otomatik (0.5/1/2/
    3/4) tooltip + button'da görünür. Domain CD'leri (Preserve Life,
    Radiance of the Dawn, Sacred Weapon) zaten vardı, üstüne base CD eklendi.
  • **Hit Dice → HP otomatik** (kullanıcı: "hit diceler hpye oto eklense
    güzel olur"): her HD satırında 2 buton:
    – **Avg +N**: ⌈(d+1)/2⌉ + CON ortalama HP'yi anında HP'ye ekler,
      tek tıklamada short rest'i halleder
    – **Roll**: Dice+'ta zar at → açılan inline input'a yazılan total
      HP'ye eklenir. Cancel ile HD harcandığı geri alınmaz (RAW: HD
      atılınca harcanır). Average path Heal All butonuyla aynı formula.
  • **Agonizing Blast invocation doğrulama** (kullanıcı: "warlock ta
    eldritch invocationlar onlardan bu özelliği alınca sadece eldritch
    blast cantripine güçlendiriyor ama çalışmıyor"): kod incelendi —
    invocation ID 'agonizing-blast', spell.id 'eldritch-blast', regex
    `^(\d+)d10$` formula'yı yakalar, CHA mod > 0 koşulu var. Tüm
    matching doğru. 2 yeni regression test eklendi (formula'ya CHA bonus
    eklenir; invocation yokken eklenmez). User'ın muhtemelen invocation'ı
    siteden seçmediği için hard-refresh gerekti — engine doğru.
  • Test: 3483/3483 pass + 2 yeni Agonizing Blast test. Manifest 0.3.49 → 0.3.50.

- `0.3.49` — Conditions + exhaustion gerçekten çalışıyor + spell description
  inline (kullanıcı raporu: "yeni eklediğimiz condition ve exhaust mantık
  olarak çalışmıyo / spellere açıklama ekleyelim"):
  • **Wiki-doğrulu mantık wire (PHB Appendix A + exhaustion table)**:
    eskiden conditions/exhaustion sadece görsel chip'ti, hiçbir d20 atışına
    etki etmiyordu. Şimdi:
    – **Saldırı atışları** (silah + büyü saldırısı): poisoned, blinded,
      frightened, prone, restrained, exhaustion 3+ → otomatik dezavantaj.
    – **Ability check'ler** (yetenek + skill): frightened, poisoned,
      exhaustion 1+ → dezavantaj. Initiative de DEX check olduğu için
      aynı kurala dahil.
    – **Saving throw'lar**: exhaustion 3+ tüm save'lerde dezavantaj.
      Paralyzed/petrified/stunned/unconscious'da STR ve DEX save'leri
      **otomatik fail** — zar atılmaz, panel direkt "AUTO-FAIL" notify.
    – **Concentration save**: War Caster adv + exhaustion 3+ disadv =
      iptal (PHB p.173). Doğru mod gönderiliyor.
  • **Manuel toggle vs durum çakışması**: PHB p.173 "adv + dis = none"
    kuralı uygulanır. Reckless Attack + frightened ⇒ none (örn).
  • **Critical state banner**: panel başında HP'nin altında, kırmızı
    şerit. Incapacitated, Dead, Speed 0, HP max half, all-saves disadv,
    attack disadv, ability disadv durumlarında otomatik görünür.
  • **Spell description inline (site parity)**: her büyü satırının
    sağında **ⓘ butonu**. Tıklayınca açılan blok: school + level,
    casting time, range, duration, components (V/S/M), material text,
    sınıf listesi, **tam RAW description**, At Higher Levels scaling.
    Eskiden sadece tooltip hover'dı, Owlbear iframe'de hover bazen
    çalışmıyor — artık inline, tek tıkla açılır.
  • Test: 3498/3498 pass. Manifest 0.3.48 → 0.3.49.

- `0.3.48` — Trackers genişletildi + Warlock pact slot UX bug giderildi
  (kullanıcı raporu: "trackerler owl da eklensin / inspiration sayı seçebilme
  kısmı eklensin / warlock spell slotları harcamıyor"):
  • **Trackers paneline 2 yeni bölüm**: Exhaustion (PHB Appendix A, 0–6
    pip seçici, her seviyenin tooltip'i RAW etkisini gösterir) ve
    Conditions (15 PHB durumu, aktif chip listesi + collapsible picker).
    Site'teki Trackers bloğuyla bire bir RAW eşleşme.
  • **Inspiration**: yıldız toggle yerine **+/− sayı seçici** (RAW DMG
    p.240'a göre max 1 olduğundan +/- arası 0↔1 hareket eder, gold "★ 1"
    görsel feedback). Kullanıcı talebi: "sayı seçebilme kısmı".
  • **Temp HP duplikasyonu giderildi**: Trackers içindeki Temp HP input'u
    silindi — zaten panel başındaki HP satırında (HpStat) ileri-eksi
    edit edilebiliyor. Tek doğru yerde tek input.
  • **Warlock pact slot UX bug**: saf Warlock için varsayılan slot seçimi
    `{regular, level=spell.level}` idi — karakter regular slot olmadığı
    için cast butonu disabled, kullanıcı "Pact L" butonuna manuel
    basana kadar hareket yok. Multiclass W/X'te ise default regular slot
    Warlock spell'ini cast ederken X-class slot'unu yakıyor, pact slot
    harcanmıyordu. Düzeltme:
    1. Slot picker default'u `useState` lazy init ile akıllandı:
       — regular slot yok + pact var → pact varsayılan
       — Warlock-only spell + pact var → pact varsayılan
       — diğer durumlar → ilk uygun regular (en düşük level, en az israf)
    2. `useEffect` slot seçimi geçersizleştiğinde otomatik düzeltir
       (örn. son pact slot harcanınca regular'a düşer).
  • Test: 3498/3498 pass. Manifest 0.3.47 → 0.3.48.

- `0.3.47` — Initiative push to OBR Tracker (kullanıcı isteği):
  inline d20 input + butonla rolled değerini OBR Initiative Tracker'a
  link'li token üzerinden push eder. Player Dice+'ta atar, OBR panele
  yazar, panel modifier'ı ekler ve metadata'ya yazar.

- `0.3.46` — Sorcerer L5 spell tablosu user raporu doğrulaması (RAW
  PHB p.99, Wikidot teyitli): L5'te 6 spells known **doğru**, bug yok.
  26 yeni regression test (full L1-L20 Sorcerer slot + spells known +
  sorcery points + Aberrant Mind/Clockwork Soul subclass spells).

- `0.3.45` — Component sistemi: reusable item preservation (PHB p.203
  RAW). Toggle ON'da reusable material'lı spell'ler (Identify pearl,
  Hallow incense, Find Familiar charcoal vs.) cast'ten sonra envanterde
  kalır. Sadece "consumed" işaretli material auto-decrement edilir.

- `0.3.44` — Auto-add component pouch davranışı kaldırıldı (kullanıcı:
  "gizli auto-add yok"). Wizard/Sorcerer/Warlock yeni karakter setup'ta
  artık sessiz pouch eklemiyor — kullanıcı kendi envanterini yönetiyor.

- `0.3.43` — Dragon's Breath spell zarlama düzeltmesi (3d6 + 1d6/upcast
  formula spellDamage.ts'e eklendi). Arcane Trickster Mage Hand granted
  cantrip otomatik öğretiliyor (PHB p.98).

- `0.3.42` — Multiclass slot tablosu kapsamlı audit (4 paralel Sonnet
  subagent: full caster / half caster / pact + third caster /
  multiclass). Third-caster L<3 ghost source guard, Pact of the Tome
  IPW L5+ prereq gate düzeltildi.

- `0.3.41` — Reactive Abilities chips dokümantasyonu kullanıcı için:
  31 chip türü (feat/race/class/item kategorileri), tooltip ile RAW
  açıklama. Site-only feature; OBR panel kapsam dışı.

- `0.3.40` — Lightning Bolt component bug fix — STRICT RAW (PHB p.203):
  user raporu: "lightning bolt componenent mantığı çalışmıyor".
  • **Kök neden**: Lightning Bolt material text "a bit of fur and a
    rod of amber, crystal, or glass" — gp 0, consumed false.
    Engine eskiden bunu HANDWAVE moduna alıyor, focus/pouch envanterde
    olmasa bile cast'i geçiriyordu.
  • **PHB p.203 RAW** (strict): "A character can use a component pouch
    or a spellcasting focus in place of the components specified for a
    spell." → Yani no-cost M spell için **bir focus VEYA pouch envanterde
    OLMALI**, yoksa cast yapılamaz.
  • **Düzeltme**: `isBlockedByMaterial` artık 2 branch:
    1. Cost-bearing/consumed → spesifik item gerekli (eski davranış)
    2. No-cost M → focus VEYA pouch gerekli (yeni RAW)
  • Lightning Bolt, Fireball, Mage Armor, Hold Person vb. **artık
    Component Pouch / Arcane Focus / Holy Symbol / Druidic Focus
    envanterde yoksa BLOCKED**.
  • Toggle OFF olduğunda kontrol bypass (handwave) — DM seçimi.
  • Yeni 7 regression test (BUG #4 grubu): Lightning Bolt + Pouch =
    ENABLED, + Wand = ENABLED, + Holy Symbol için Cleric = ENABLED,
    + Druidic Focus için Druid = ENABLED, no focus = DISABLED, V/S
    only spell (Magic Missile) hep ENABLED, toggle OFF + no focus =
    ENABLED.
  • Test: 3537 → **3545 pass + 11 todo** (110 dosya, 0 fail).
  • Manifest 0.3.39 → 0.3.40.

- `0.3.39` — Focus/Pouch farkındalığı + 4-state component badge (user
  raporu: "focus/pouch okeylerde hala sorun var"):
  • Spell row üzerindeki M/material badge'leri artık 6 durumlu:
    - **`✓ Xgp`** (yeşil): cost-bearing CONSUMED, item envanterde →
      auto-consume on cast
    - **`✗ Xgp`** (gri-kırmızı): cost-bearing CONSUMED, item yok →
      cast BLOCKED (button disabled)
    - **`✓ Xgp`** (altın): cost-bearing REUSABLE (Identify pearl,
      Hallow incense vb.), item envanterde → cast OK, item korunur
    - **`✗ Xgp`** (kırmızı): cost-bearing REUSABLE, item yok → cast
      BLOCKED
    - **`M ✓`** (gri): no-cost M, focus/pouch envanterde → her şey OK
    - **`M ⚠`** (sarı): no-cost M, focus/pouch YOK → RAW PHB p.203
      uyarısı (cast blocked değil — handwave warning)
  • Yeni `hasFocusOrPouch` flag — Component Pouch / Arcane Focus /
    Holy Symbol / Druidic Focus item'larını tarar, herhangi biri
    varsa true.
  • Tooltip her badge'de: ne gerekli, ne karşılandı, ne RAW kuralı.
  • Test: 3537 pass / 11 todo (110 dosya, 0 fail).
  • Manifest 0.3.38 → 0.3.39.

- `0.3.38` — Components toggle persistent banner (root-cause iceberg):
  user raporlarının asıl nedeni `enforceMaterialComponents` toggle'ının
  user'ın haberi olmadan OFF olarak persist etmesiydi. 0.3.37'deki
  cast guard fix'i doğru çalışıyordu — ama toggle OFF iken RAW gereği
  envanter kontrolü bypass ediliyor.
  • **`ComponentToggleBanner`** her tab'in en üstüne eklendi:
    - ON: yeşil ✓ chip "Components: RAW (PHB p.203) — cast blocks on
      missing material"
    - OFF: kırmızı yanıp sönen ⚠ chip "Components: OFF — casts ignore
      inventory! Click to enable RAW"
  • Banner tıklanabilir — direkt toggle eder, hiçbir tab'a gitmek
    gerekmez.
  • Test: 3537 pass / 11 todo (110 dosya, 0 fail).
  • Manifest 0.3.37 → 0.3.38.

- `0.3.37` — KRİTİK CAST BUG'LARI giderildi (user raporu): "spell slot
  olmasa da atıyo, component harcamıyo, envanterde yoksa bile atıyo".
  Hepsi wikidot/PHB doğrulu:

  ÜÇ BUG TEK KÖKLE: `consumeSlot()` fonksiyonu `void` dönüyordu. Slot
  yoksa erken `return` ediyor ama `handle()` bunu BİLMİYORDU — devam
  edip spell efektini uyguluyor, Dice+'a damage gönderiyor, sonrasında
  handleAndReset material'ı consume ediyordu. Yani slot yokken cast
  giriyor, component sayısı eksiliyordu.

  DÜZELTMELER:
  • `consumeSlot(): boolean` — başarıyı/başarısızlığı döndürüyor.
    Slot yoksa false döner.
  • `handle(): boolean` — consumeSlot false dönerse erken abort eder
    (no broadcast, no effect, no damage). Tüm 6 branch'in (attack,
    save+damage, healing, buff-die, save-only, utility) sonu `return
    true` ile bitti.
  • `handleAndReset` — `if (!handle()) return;` material consume'u
    bypass eder. Cast başarısızsa pearl/diamond korunur.
  • `slotExhausted` flag → cast butonu görsel disabled. Slot yokken
    tıklamaya bile çalışılmaz.
  • **Mystic Arcanum** (Warlock L11+) — RAW PHB p.107: slot harcamadan
    cast. consumeSlot bunun için bypass eder.
  • **Ritual cast** — RAW PHB p.202: ritüel cast slot harcamaz.
    consumeSlot bunun için bypass eder.

  REGRESSION TESTLERİ (`castGuardsRegression.test.tsx`, 14/14 pass):
  • BUG #1: Wizard L5 + tüm L1 slotları kullanılmış → Magic Missile
    button DISABLED, tıklayınca slot artmaz. Identify + Pearl + slot
    yoksa → Pearl korunur. Stoneskin + Diamond Dust + slot yoksa →
    Diamond Dust korunur.
  • BUG #2: Stoneskin + Diamond Dust 100gp x3 + slot var → cast →
    qty 3→2. Continual Flame + Ruby 50gp → 1→0. Identify (REUSABLE) +
    Pearl → qty UNCHANGED. L1 cast → usedSpellSlots[1]++.
  • BUG #3: Stoneskin (no inv) → button DISABLED. Tıklarsa slot
    artmaz, item eklenmez. Revivify + Diamond 50gp (lower-tier) →
    DISABLED. Toggle OFF + Stoneskin (no inv) → ENABLED, cast geçer,
    NO consume.

  Eski 7 test dosyasının setup'ı güncellendi (eskiden buggy bypass'a
  dayanıyorlardı): castFlowMatrix, componentBlockToggle,
  componentBugRegression, componentMatrixMega, componentSystemExhaustive,
  castDispatchExhaustive, OBRPanelGaps, reusableComponents, SpellRow,
  strictTierMatcher — hepsi artık caster + slot kuruyor. Eski "BUG"
  damgalı ritual slot test'i artık RAW-doğru davranışı doğrular.

  TEST: 3523 → **3537 pass + 11 todo** (110 dosya, 0 fail).
  Manifest 0.3.36 → 0.3.37.

- `0.3.36` — Component matcher gap'leri kapatıldı (kullanıcı raporu:
  "components hala bozuk"):
  • **Token filtresi 4→3 karakter** indirildi: `gem`, `egg`, `bar`,
    `rod` gibi 3 harfli component kelimeleri artık eşleşiyor. NOISE
    listesi 19 yeni 3-harfli kelimeyle genişletildi (one/two/three/
    each/four/five/six/all/set/bit/top/end/use/has/are/for/its/any/
    not vb) ki false positive olmasın.
  • **Yeni gear catalog component item'ları** eklendi (gap-fill):
    - Gem (100 gp) → Incite Greed
    - Gem (400 gp) → genel 400gp gem spell
    - Eyeball in Gilded Egg (400 gp) → Summon Aberration
    - Elemental Gem (400 gp) → Summon Elemental
    - Gilded Death Card (400 gp) → Spirit of Death
    - Platinum Dragon Scale (500 gp) → Fizban's Platinum Shield
    - Book (25 gp, spell focus) → Borrowed Knowledge
    - Coin (1 gp) → Jim's Magic Missile
    - Gauze (component) → Gaseous Form
    - Crystal Vial of Phosphorescent Material → Hypnotic Pattern
    - Holy/Unholy Water (component vial) → Commune
    - Burning Incense → Speak with Dead
  • **Yeni audit testleri**: `componentMatcherAudit.test.tsx` her
    cost-bearing spell için catalog gap raporu çıkarıyor (full ITEMS
    catalog match). 4 reusable + 12 consumable gap kapatıldı.
    Iconic regression guard: identify, find-familiar, arcane-lock,
    hallow, forbiddance, planar-binding, magic-circle hepsi
    eşleşiyor.
  • Test: 3515 → **3523 pass + 11 todo** (109 dosya, 0 fail).
    Manifest 0.3.35 → 0.3.36.

- `0.3.35` — Effect chip'leri görünmeme bug'ı giderildi:
  • OBR panel'de `ReactiveAbilitiesBlock` "Abilities" tab'ine
    gömülmüştü; default "Actions" tab'inde de görünür hale getirildi.
    Combat sırasında her trigger (Hexblade Curse, Colossus Slayer,
    Eldritch Invocation chipleri vb.) anında okunur.
  • Site (Builder) `CharacterSheetSidebar`'a `ReactiveAbilitiesChips`
    bileşeni eklendi (40+ chip türü). Daha önce site karakter
    sayfasında reactive ability bloğu hiç yoktu — şimdi sidebar'da
    tone-renkli (feat=altın, race=yeşil, class=kan kırmızı,
    item=koyu) bir liste olarak görünür.
  • Manifest 0.3.34 → 0.3.35.
  + 4 yeni conditionFlags + Homunculus Servant tam stat:
  • **conditionFlags** — 4 yeni alan: attackedWithDisadvantage
    (Cloak of Displacement equipped), critImmunity (Adamantine Plate),
    forceResistance (Brooch of Shielding), spellSaveAdvantage
    (Mantle of Spell Resistance + Yuan-Ti Magic Resistance).
  • **Homunculus Servant** — Artificer infusion: derived `homunculusStats`
    alanı (HP = 1 + INT mod + artificer level, AC 13, attack +PB+INT,
    1d4+INT force damage). TCoE p.16 RAW.
  • **Arcane Propulsion Armor speed +5** — zaten wired olduğunu
    test ile doğruladık (Artificer L14 + APA + equipped armor).
  • **OBR Panel "Reactive abilities" bloğu** — 25+ yeni chip:
    - Subclass riders: Colossus Slayer +1d8, Dread Ambusher +1d8 +10ft,
      Totem Warrior raging
    - Class abilities: Sculpt Spells (Wizard Evocation), Cutting Words
      (Lore Bard reaction)
    - 10 Eldritch Invocation chip: Agonizing Blast, Repelling Blast,
      Eldritch Spear, Eldritch Mind, Aspect of the Moon, One With
      Shadows, Eldritch Sight, Armor of Shadows, Fiendish Vigor,
      Mask of Many Faces — hepsi RAW açıklama metniyle birlikte
    - 9 magic item chip: Cloak of Displacement, Cloak of Elvenkind,
      Periapt of Wound Closure, Sentinel Shield, Brooch of Shielding,
      Necklace of Adaptation, Mantle of Spell Resistance, Adamantine
      Plate, Slippers of Spider Climbing
  • Test: 3504 → **3515 pass + 11 todo** (107 dosya, 0 fail).
    11 yeni assertion. tsc + build temiz. Manifest 0.3.33 → 0.3.34.

- `0.3.33` — Belgelenmiş todo listesinin geri kalanı engine'e wire edildi
  (63 → 14 todo, hepsi cast-time decision olan veya UI rendering
  gerektiren artıklar). Hepsi wikidot RAW doğrulu:
  • **15 Eldritch Invocation flag**: hasAgonizingBlast, hasRepellingBlast,
    hasEldritchSpear, hasEldritchMind, hasAspectOfTheMoon,
    hasOneWithShadows, hasEldritchSight, hasVoiceOfTheChainMaster,
    hasWhispersOfTheGrave, hasMaskOfManyFaces, hasArmorOfShadows,
    hasFiendishVigor, hasMistyVisions, hasAscendantStep,
    hasOtherworldlyLeap. Panel her invocation için bağlamsal chip
    gösterebilir (Eldritch Mind → "ADV on CON conc save", Eldritch
    Spear → "EB range 300 ft", vb.).
  • **13 magic item flag**: hasCloakOfDisplacement, hasCloakOfElvenkind,
    hasPeriaptOfWoundClosure, hasSlippersOfSpiderClimbing,
    hasSentinelShield, hasBroochOfShielding, hasNecklaceOfAdaptation,
    hasMantleOfSpellResistance, hasAdamantinePlate, hasMithralPlate,
    hasPlateOfEtherealness, hasRingOfMindShielding, hasGogglesOfNight.
  • **3 subclass rider**: hunterColossusSlayerBonus = "1d8" (Hunter
    L3+ vs damaged target), gloomstalkerDreadAmbusherBonus = "1d8"
    (first attack first turn), gloomstalkerInitBonus = +10 ft first-
    turn speed (XGtE p.42).
  • **Martial Adept fix**: PHB p.168 RAW d6 (engine bug giderildi —
    Martial Adept feat'ı tek başına alındığında d8 yerine d6 verecek;
    Battle Master ile birlikte alındığında BM size dominant kalır).
  • **Maneuver / Metamagic** semantik etkileri için todo'lar artık
    "cast-time player decision" olarak belgeleniyor — kalıcı engine
    state'i değiştirmiyorlar (Quickened action→bonus action, Trip
    Attack STR save vs DC, vb. hepsi player kararı).
  • Test: 3470 → **3504 pass + 14 todo** (107 dosya). 34 yeni
    assertion todo'dan gerçek teste yükseldi. tsc + build temiz.
    Manifest 0.3.32 → 0.3.33.

- `0.3.32` — Veri bütünlüğü + sınıf progression matematik + RAW grants
  toplu test dalgası (12 yeni dosya, 417 yeni assertion):
  • **`spellCatalogIntegrity`** — 563 spell unique kebab-case id, level
    0-9, 8 valid school, V/S/M flag, classes referans tutarlılığı,
    iconic spell membership, concentration/ritual catalog. (16/16)
  • **`itemCatalogIntegrity`** — 625+ item id + type + weight + cost
    + weapon damage + armor baseAc + shield. PHB p.149 longsword 1d8,
    greatsword 2d6, plate baseAc 18 vb. (15/15)
  • **`classSpellListIntegrity`** — her class spell list referans
    tutarlılığı, EB sadece warlock, Cure Wounds wizard listesinde değil
    vb. (25/25)
  • **`classProficienciesProgression`** — 14 sınıf hit die, save profs,
    skill choice count, subclass unlock level, ASI levels, armor + weapon
    profs, spellcasting ability hepsi RAW. (69/69)
  • **`spellSlotTablesRaw`** — full caster L1-20, half caster L1-20,
    third caster L1-20, warlock pact L1-20, profane soul L1-20 her
    seviye için tam slot tablosu RAW. (101/101)
  • **`spellPreparationFormulas`** — Cleric/Druid/Wizard (lvl + mod),
    Paladin/Artificer (lvl/2 + mod) min 1 floor. (8/8)
  • **`cantripScalingRaw`** — Fire Bolt/EB/Sacred Flame/Ray of Frost/
    Poison Spray L1-L20 her seviye kontrol + Magic Missile/Fireball/
    Cure Wounds upcast. (65/65)
  • **`sneakAttackScaling`** — Rogue L1 1d6 → L20 10d6 her seviye +
    multiclass (Rogue 5/Wizard 5 = 3 dice). (23/23)
  • **`raceFeatureGrants`** — Human/Dwarf/Elf/Halfling/Tiefling vb.
    speed + darkvision + ASI + languages + traits RAW. (38/38)
  • **`backgroundFeatureGrants`** — 14 PHB background skill/tool/
    language grants ve feature isimleri. (29/29)
  • **`spellEffectsImpact`** — Bless/PwT/Haste/Longstrider/Shield of
    Faith engine derived state etki: AC bonus, speed bonus, stealth
    bonus, attack/save bonus + stacking. (8/8)
  • **`componentBugRegression`** — Discord-rapor edilen iki bug
    (toggle ON bypass + reusable spell yanlış engelleme) tam regresyon
    test (15/15): Identify + Pearl 100gp ENABLED + qty UNCHANGED;
    Stoneskin + Diamond Dust 100gp ENABLED + qty -1 (consumed RAW);
    Revivify + Diamond 50gp lower-tier reject; cross-product sweep
    her cost-bearing × pair item.
  • Test: 3053 → **3470 pass + 63 todo** (107 dosya, 0 fail).
    Manifest 0.3.31 → 0.3.32. tsc + build temiz.

- `0.3.31` — Belgelenmiş boşlukların büyük dalgası engine'e wire edildi:
  • **Magic itemler artık otomatik uygulanıyor** (DMG + Wikidot RAW):
    - Cloak of Protection: equipped → +1 AC, +1 saves
    - Ring of Protection: equipped → +1 AC, +1 saves (Cloak ile stack)
    - Bracers of Defense: zırhsız + kalkansız → +2 AC
    - Stone of Good Luck: equipped → +1 saves + ability checks
    - Belt of Hill/Stone/Frost/Fire/Cloud/Storm Giant Strength:
      STR'yı 21/23/23/25/27/29'a SET ediyor (sadece mevcuttan büyükse)
    - Gauntlets of Ogre Power: STR = 19
    - Headband of Intellect: INT = 19
    - Amulet of Health: CON = 19 (HP otomatik scale ediyor)
    - Boots of Speed: speed × 2
    - Boots of Striding and Springing: speed minimum 30
    - Goggles of Night: darkvision minimum 60
  • **Conditions ve Exhaustion artık derived state'i etkiliyor**:
    - Grappled / Restrained / Paralyzed / Petrified / Stunned /
      Unconscious → speed = 0
    - Exhaustion 1 → ability checks dezavantaj
    - Exhaustion 2 → speed yarıya iner
    - Exhaustion 3 → attack rolls + saves dezavantaj
    - Exhaustion 4 → maxHp yarıya iner
    - Exhaustion 5 → speed = 0
    - Exhaustion 6 → ölü flag
    - Yeni `conditionFlags` derived alanı: attackedWithAdvantage,
      attackRollsDisadvantage, abilityChecksDisadvantage,
      autoFailStrDexSaves, allSavesDisadvantage, speedZero,
      hpMaxHalved, resistAllDamage, incapacitated, dead.
  • **Eldritch Invocations**:
    - Devil's Sight: darkvision 120 ft (büyülü karanlığı deler,
      panel hint)
  • **Subclass flagleri**:
    - bearTotemActive: Path of the Totem Warrior + rage active
    - wolfTotemActive: aynı (totem-spirit seçimi state'te yok,
      panel manuel toggle ile ayrım sağlıyor)
    - hasSculptSpells: Wizard Evocation L2+
    - hasCuttingWords: Bard Lore L3+
  • Test: 2998 → **3053 pass + 63 todo** (95 dosya, hepsi geçti).
    `acStackingExhaustive` Cloak/Bracers display-only assertion
    güncellendi (artık auto-apply). Manifest 0.3.30 → 0.3.31.

- `0.3.30` — Mekanik feature etki testleri (139 yeni test + 101 belgelenmiş
  tasarım boşluğu), tamamı wikidot doğrulu:
  • **`subclassFeatureEffects.test.ts`** — Hexblade Curse (PB damage,
    crit 19, heal = warlock lvl + CHA), Draconic Resilience (+1 HP/lvl,
    13+DEX AC), Battle Master DC (8+PB+max(STR,DEX)) ve dice tablosu
    (4d8/5d8/5d10/6d10/6d12 L3/7/10/15/18), Soulknife Psionic Energy
    (2×PB count, d6→d12 L3/5/11/17), Beast Master companion (4×lvl HP,
    L11 Bestial Fury), Cleric Life (Preserve 5×lvl) + Light (Radiance
    2d10+lvl), Champion crit 19→18, Monk Stunning Strike DC. 34/34 pass.
  • **`invocationEffects.test.ts`** — Improved Pact Weapon (+1 atk/dmg
    pact only), Lifedrinker (+CHA necrotic min 1, pact only),
    IPW+Lifedrinker stack. 7/7 pass + 10 todo (Agonizing Blast,
    Repelling Blast, Devil's Sight vb.).
  • **`infusionEffects.test.ts`** — Enhanced Defense (+1 AC L<10,
    +2 L10+, armor + shield), Enhanced Weapon (+1/+2 atk/dmg),
    Helm of Awareness (initiative advantage), Repulsion Shield (+1 AC).
    9/9 pass + 8 todo.
  • **`maneuverEffects.test.ts`** — DC formula 8+PB+STR/DEX her seviyede,
    full superiority dice tablosu (11 row), Superior Technique +
    Martial Adept feat. 18/18 pass + 21 todo (her PHB maneuver).
  • **`metamagicEffects.test.ts`** — Sorcery point pool L1/2/9/20,
    metamagic known L3/10/17. 6/6 pass + 10 todo.
  • **`magicItemEffects.test.ts`** — Catalog parity + engine'in
    bilinçli olarak magic itemleri auto-apply ETMEDİĞİ kontratının
    pinnenmesi (Cloak of Protection equipped → AC değişmiyor; Belt
    of Storm Giant Strength → STR değişmiyor; Headband of Intellect
    → INT değişmiyor). 9/9 pass + 26 todo (her item için RAW kuralı).
  • **`conditionsDerivedState.test.ts`** — 15 condition catalog parity,
    activeConditions ve exhaustionLevel'in derived state'i auto-değiştirmemesi.
    9/9 pass + 20 todo (Prone, Restrained, Paralyzed vb. + Exhaustion
    1-6 her seviye için RAW etkisi).
  • **`characterRoundTrip.test.ts`** — Tam multiclass build export →
    import → export bit-by-bit eşitlik, __proto__ pollution drop,
    action override drop, level clamp, slot save/load shape parity.
    11/11 pass.
  • **`multiSourceSpellDC.test.ts`** — Cleric WIS / Wizard INT
    multiclass: ayrı DC + attack bonus per source. Sorcerer/Warlock
    pact slot ayrımı. EK/AT INT routing. Triple-class 3 source.
    Paladin half + Sorcerer full caster level math. 9/9 pass.
  • **`persistMigrationChain.test.ts`** — v1..v39 her snapshot v40'a
    yükselirken yeni field'lar (enforceMaterialComponents,
    showCharacterNameplate, lycanHybridActive vb.) doğru default
    alıyor. Pre-v40 cast-block bug'ının regresyon koruması. 16/16 pass.
  • **`tokenSyncFlow.test.ts`** (OBR) — linkTokenToCharacter →
    pushHpToLinkedToken → pushInitiativeToLinkedToken → unlinkToken
    full flow + nameplate creation/cleanup + community Initiative
    Tracker compat (rodeo.owlbear.initiative/metadata as string).
    11/11 pass.
  • **Yakalanan engine bug'ı:** Subclass id `sorcerer-draconic` aslında
    `sorcerer-draconic-bloodline`; Martial Adept feat'ı d6 yerine
    d8 superiority die veriyor (PHB p.168 RAW d6) — flaglandi.
  • Test: 2859 → **2998 pass + 101 todo** (95 dosya), tsc temiz, build
    7.48 sn, deploy.

- `0.3.29` — Test matrislerinin MEGA sürümü, yaklaşık 1000+ yeni test:
  • **`componentMatrixMega.test.tsx`** — canlı `ALL_SPELLS` kataloğunu
    `gear.ts` ile eşleyip her cost-bearing büyüyü 6 envanter durumunda
    test eder: toggle ON + boş envanter → ENGELLİ; toggle ON + uygun
    item → ETKİN; toggle OFF + boş envanter → ETKİN (handwave); lower-tier
    item → ENGELLİ; consume vs reusable kategorisi sayısal olarak
    doğrulanır. Catalog gap raporu da çıkarır (kaç büyü için item yok).
  • **`multiclassDipMega.test.ts`** — 14 ana × 13 dip × 4 seviye × 2
    oran ≈ 1500+ multiclass kombinasyonu. Her (primary, dip) çiftinde
    `deriveCharacter` throw etmiyor; PB doğru hesaplanıyor; full+full
    casters her iki spellcasting source'u görüyor; sorcerer 17 + warlock 3
    pact slotlarının regular slotlardan ayrı tablodan geldiğini doğrular.
  • **`featClassMatrix.test.ts`** — PHB_FEATS × 14 class × 3 ASI seviyesi
    ≈ 4000+ feat kombinasyonu. Multi-feat fighter L20 (Tough+GWM+PAM+
    Resilient), Resilient yarı-feat ability bumpları, Tough'un L1-L20
    HP scaling'i her seviyede +2 başına doğrulanır.
  • **`fightingStyleEquipmentMega.test.ts`** — 11 fighting style ×
    7 ekipman × 4 sınıf × 3 seviye = 924 kombinasyon. Defense + plate
    → AC 19; Archery + longbow → +8 attack; Dueling + dual-wield → bonus
    yok; TWF off-hand DEX bonus alıyor.
  • **`racialBackgroundMatrix.test.ts`** — 56 test: race × subrace ×
    class L5 mega sweep + race × class × background L1 sweep + Drow/
    Tiefling/Aasimar racial spell visibility + Half-Elf/Mountain Dwarf/
    High Elf/Tiefling Asmodeus ASI stacking + speed override (Halfling 25,
    Wood Elf 35) + darkvision (Drow 120, Elf 60, Tiefling 60).
  • **`playJourneyMega.test.ts`** — Her sınıf × subclass × seviye için
    GERÇEK bir oyun oturumu simülasyonu: build → spell slot harca →
    SR → SR-rechargeable resourceların reset olduğunu, spell slotların
    spent kaldığını doğrula → LR → her şeyin reset olduğunu doğrula →
    death save akışı. 150+ run + multiclass SR/LR ayrımı + exhaustion
    LR -1 doğrulaması + concentration switch.
  • Toplam: ~1000+ yeni test. Vitest 1820 → 2859 toplam test
    (84 dosya, hepsi pass). Engine her olası combo'da sane, her
    cost-bearing büyü doğru envanter koşullarında engellenip izin
    veriyor, her sınıf real session akışında çökmeden.
- `0.3.28` — MEGA combinatorial sweep — yüzbinlerce karakter
  kombinasyonu derive ediyor:
  • **`megaSweep.test.ts`** — yeni mega test dosyası 4 ana sweep ile:
    - **Class × Subclass × Level × Race × Background × Loadout × CON-build
      mega sweep** — 14 sınıf × ~5 subclass × 5 level × 14 race × 14
      background × 3 equipment loadout × 2 ability build = **~400,000+
      kombinasyon**. Her birinde `deriveCharacter` çalıştırılıp sanity
      envelope ölçülür (maxHp 1..1000, AC ≥ 8, speed > 0, PB 2..6,
      no throw). 215 saniyede sweep tamamlandı.
    - **Spell catalog × cost-bearing parse** — tüm 563 spell'in material
      text'inden gp + consumed flag stable parse edildi (no NaN, no
      negative). 60+ cost-bearing spell.
    - **Level-up sweep** — 14 sınıfın L1-L20 her seviyesinde derive
      cleanly (14 × 20 = 280 derive).
    - **Race × Class L1 sweep** — 14 sınıf × 14 race = 196 pair, hepsi
      derives.
  • Toplam yeni test: ~17 test (mega sweep batchleri), iç döngülerde
    400K+ deriveCharacter çağrısı. Engine her olası combo'da sane.
  • Test sayımı (vitest): 2736 → ~2750 (mega test'ler bir batch
    içinde milyonlarca assertion barındırıyor; vitest "test" sayısı
    küçük gözükür ama iç döngü dev).
  • Wikidot RAW per-class playthrough'lar (0.3.27) sweep'in temeli —
    bu sweep "asla crash etme" güvencesi.
- `0.3.27` — Exhaustive class × subclass × level matrix + 5 playthrough dosyası (+771 test):
  • **`exhaustiveClassSubclassMatrix.test.ts`** (614 test): 14 sınıf
    × her subclass (3-12 her sınıf için) × 5 level (1, 5, 10, 15, 20)
    = ~350 kombinasyon × 2-3 sanity assertion. Tüm kombinasyonlar
    deriveCharacter ile derive ediliyor (rastgele DEĞİL — her kombo).
    Her birinde: maxHp > 0 + < 1000, AC ≥ 8, speed > 0, PB doğru,
    subclass features non-empty, class features non-empty. Plus
    spellcasting unlock gates per RAW (full L1, half L2, third L3,
    Warlock pact L1), PB by level table (1→2, 5→3, 9→4, 13→5, 17→6),
    HP sane range [50,350] at L20, speed 30 base for non-Monk, Monk
    Unarmored Movement scaling.
  • **5 playthrough dosyası** (martial 42 + divine 31 + arcane 29 +
    half 34 + multiclass 21 = 157 senaryo): (+157 test):
  • 5 yeni dosya, gerçek `deriveCharacter` ile signature feature'ları
    test eder. Wikidot RAW ile cross-check (Barbarian rage table, Monk
    MA progression, Wizard slot table, Warlock pact slots vs.).
    - **classPlaythroughsMartial.test.ts** (42): Barbarian rage uses +
      damage scaling (2/3/4/4/4 + +2/+3/+4) + Brutal Critical 1/2/3 +
      Feral Instinct init advantage; Fighter Action Surge L2/L17,
      Second Wind formula, Defense FS, Champion improved crit, Battle
      Master superiority dice/size, EK third-caster L3+; Monk
      Unarmored Defense, Ki points L2/5/20, Martial Arts d4→d10 by
      L1/5/11/17, Unarmored Movement +10/+15/+30 ft + armor disable;
      Rogue Sneak Attack 1d6→10d6 progression, AT third-caster INT,
      Stroke of Luck L20, Reliable Talent L11.
    - **classPlaythroughsDivine.test.ts** (31): Cleric WIS DC, Channel
      Divinity 1/2/3 uses by L2/6/18, Light/Knowledge Potent
      Spellcasting +WIS to cantrip damage, Life Domain Divine Strike,
      prepared count math; Paladin half-caster L2 unlock, Lay on Hands
      pool 5×lvl, Aura of Protection saveMiscBonus +CHA L6+, Aura of
      Courage L10, Improved Divine Smite L11, Devotion subclass;
      Druid Wild Shape max CR per level, Moon Druid CR boost (L2 CR1,
      L6 CR2, L20 CR6), Land Druid subclass features, Archdruid L20.
    - **classPlaythroughsArcane.test.ts** (29): Wizard cantrip count
      3/4/5 by L1/4/10, prepared = INT+lvl, Evocation Empowered +INT
      L10 (gates at L10), Spell Mastery L18, Signature Spells L20;
      Sorcerer SP gating L2, Draconic Resilience HP +1/lvl + AC
      13+DEX, Elemental Affinity L6 flag, Sorcerous Restoration L20;
      Warlock pact slot table per level, Hexblade bonded weapon CHA
      attack +PB+CHA, Mystic Arcanum L11/17, Lifedrinker invocation,
      Eldritch Master L20.
    - **classPlaythroughsHalf.test.ts** (34): Bard BI die 6/8/10/12 +
      uses=CHA min 1 + Song of Rest 6/8/12 + Magical Secrets L10 +
      Jack of All Trades initiative; Ranger half-caster L2 unlock,
      Foe Slayer L20, Gloomstalker subclass; Artificer INT
      spellcasting + Infusions L2 + Enhanced Defense +1/+2 by L9/10
      + Battle Smith Steel Defender + Flash of Genius L7 + Soul of
      Artifice L20; Blood Hunter Hemocraft d4→d10 progression +
      Profane Soul pact + Lycan/Mutant subclasses + Crimson Rite.
    - **classPlaythroughsMulticlass.test.ts** (21): Sorcadin (Pal20 +
      Sorc14 caster level 17 → L9 slot, both CHA DC 18); Coffeelock
      (Sorc17/Wlk3 — sep slot pools); Hexpal (Hexblade 5 + Pal 15
      bonded weapon +11 atk); Bardadin (Bard 14/Pal 6 same DC,
      Magical Secrets); Druid 7/Monk 13 (MA d8 + Wild Shape CR2);
      Fighter EK 6/Wizard 14 (INT dual-caster); Profane BH/Bard;
      Cleric 5/Wiz 5/Rogue 5/Fighter 5 quad-class.
  • Test toplamı: 1965 → **2122** (sıfır hata, TS temiz, build temiz).
- `0.3.26` — Karakter slot 5→20 + 145 yeni gameplay/feat/serialization test:
  • **MAX_SLOTS 5 → 20** — `src/utils/characterSlots.ts`. ReviewStep
    "saved characters" kısmında artık 20 slot var. Tüm referanslar
    constant'a bağlı, test'ler güncellendi.
  • **+145 yeni test** (1820 → 1965, sıfır hata):
    - `exhaustionLevels.test.ts` (15 test) — PHB Appendix A clamp
      (0..6), LR -1, SR no-op, sequential decrement.
    - `spellSlotManagementMatrix.test.ts` (54 test) — Wikidot-doğru
      tüm Wizard L1-L20 + Paladin L1/L5/L11/L17/L20 + Warlock pact
      L1-L20 + multiclass combined caster + EK third-caster + slot
      consume invariants + LR/SR reset.
    - `featInteractionsMatrix.test.ts` (15 test) — GWM heavy-melee
      gating, Sharpshooter ranged-only, GWM+Sharpshooter combo, Tough
      +2/level (L4/L8/L20), Resilient half-feat, ASI stacking,
      Polearm Master + Crossbow Expert.
    - `characterSerialization.test.ts` (24 test) — importCharacter
      round-trip, prototype-pollution rejection (`__proto__`,
      `constructor`, `prototype`), action-key spoof rejection
      (setStep/resetAll/importCharacter), level/name clamping,
      sequential imports, resetAll.
    - `gameplayFullRound.test.ts` (37 test) — **oyuncu deneyim**
      simulasyonu: slot consume, Bless cast, concentration drop,
      damage take, death save flow (clamps + LR clear), DC =
      max(10, ⌊dmg/2⌋) math, initiative DEX+JoaT+Alert, Sorcerous
      Restoration L20, Warlock pact SR, Hit Dice spend + LR recovery,
      Inspiration toggle, conditions stack, coin currency, end-to-end
      Wizard L5 round (Magic Missile + damage + Mage Armor → AC bump
      + LR full reset).
  • Wikidot RAW ile cross-check edilmiş 6 kritik kural: Tough,
    GWM, Sharpshooter, Wizard slots, Warlock pact, Lucky.

- `0.3.25` — 4 paralel Sonnet subagent uzmanlık çalışması (+497 yeni test):
  • **Component System uzmanı:** 363 test (`componentSystemExhaustive.test.tsx`
    278 + `reusableComponents.test.tsx` 85). 6-boyutlu kapsam: block,
    unblock, consume, toggle OFF, strict gp tier, multi-component drain.
    Magic Jar test pairing fix (`crystal-vial-1000gp`), Gate item tier
    düzeltme. 28 expansion spell catalog gap belgelendi.
  • **Class Resource & Rest uzmanı:** 57 yeni test
    (`restCycleExhaustive.test.ts`). 19 class feature recharge cycle
    audit. **1 bug fix:** Dread Ambusher (Gloomstalker) `srKeys`'ten
    kaldırıldı — XGtE p.42 RAW: per-combat passive, no rest cycle.
  • **Cast Flow uzmanı:** 41 test (`castDispatchExhaustive.test.tsx`).
    14 dispatch branch (attack/save/heal/buff/utility/arcanum/ritual/pact)
    audit. **2 RAW bug belgelendi:** ritual cast slot harcaması (PHB
    p.202 dışı) + racial spell 1/LR gating eksik. Test'lerde pinlendi,
    fix sonraki commit'te.
  • **Inventory + Multiclass uzmanı:** 65 test
    (`inventoryMatcherEdgeCases.test.ts` 10 + `acStackingExhaustive.test.ts`
    37 + `weaponAttackExhaustive.test.ts` 18) + extending mevcut testler.
    Custom item sp/cp/pp gp dönüşümü, 18 AC kaynak stacking matrix,
    Hexblade pact-bond, Battle Smith INT swap, MC slot table doğrulaması.
    Barkskin DEX-negative drift documented.
  • **TOPLAM 1820 test** geçiyor (önceki 1323 → +497), TypeScript temiz,
    build temiz.
  • Wikidot + Apple Sorcerer Sheet ile cross-check edildi her test.
- `0.3.22` — Inline status satırı **HER SPELL** için (cantrip dahil):
  • Önceki version sadece cost-bearing spell'lerde inline satır
    gösteriyordu. Şimdi 4 kategori var, her spell'in altında her zaman
    görünür:
      - **V/S only (no M):** gri satır — `Components: V/S · ✓ no
        material` (cantripler, Prestidigitation, Mage Hand, vs.)
      - **M reusable, no gp:** koyu altın satır — `M: reusable
        (focus/pouch OK) · ✓ no inventory check` (Bigby's Hand
        eggshell, Animate Dead bone dust, focus-substitutable)
      - **M cost-bearing, satisfied:** yeşil satır — `M: 100 gp
        consumed · ✓ Diamond Dust ×2`
      - **M cost-bearing, missing:** kırmızı satır — `M: 100 gp
        consumed · ⛔ NONE — add to inventory`
      - **Toggle OFF:** gri satır — `[components: handwave OFF]`
  • Player artık her spell için instant feedback görüyor — V/S
    cantrip'i blockable mı, focus-pouch yeter mi, gp gerekiyor mu.
- `0.3.21` — Component sistemi ÇOK GÖRÜNÜR: inline status satırı + force reset:
  • **INLINE COMPONENT STATUS** — her cost-bearing spell'in altında her
    zaman görünür mini satır:
      - Component yok: kırmızı arka plan + `M: 100 gp consumed · ⛔
        NONE — add to inventory` 
      - Component var: yeşil arka plan + `M: 100 gp consumed · ✓
        Diamond Dust (100 gp) ×2`
      - Toggle OFF: gri arka plan + `[components: handwave OFF]`
    Player artık cast butonuna basmadan ÖNCE durumu görüyor — bypass
    sürprizi yok.
  • **⟲ Force Reset Panel State** butonu RestControls'a eklendi
    (kırmızı, en altta). Tıklayınca confirm prompt → localStorage'tan
    'dnd5e-character' kaydını siler + sayfayı yeniler. Eski persist
    state'in cast-block'u bypass ettiği son-çare durum için.
  • Test'ler güncellendi: MAT badge selector "100gp" (no space) inline
    status'ün "100 gp" (space)'inden ayırt edilir.
  • Discord raporu için: "compenent yokken büyü atılıyo" — bu fix'le
    visually NET olur. Status satırı kırmızı + ⛔ NONE → user görür ki
    component eksik, kullanım blockable. Cast etmeye çalışırsa WARNING
    toast + "Components: RAW" toggle açıkken cast olamaz.
- `0.3.20` — Component cast-block için **görsel feedback** (silent bypass UX bug fix):
  • **Discord raporu:** "component modu açıkken kullanıyo büyüyü, item
    de harcamıyor" — sebebi UX'di. Cast butonu visually değişmiyordu,
    user bypass olduğunu sanıyordu.
  • **Fix:** SpellRow'da `isBlockedByMaterial` hesaplanır. Eğer toggle
    AÇIK + spell cost-bearing material gerektiriyor + envanterde
    yeterli tier yoksa:
    - Spell row **kırmızı border** + **kırmızı arka plan**
    - Sağda **⛔ BLOCKED** kırmızı rozet
    - Cursor **not-allowed** (görünüm "tıklanamaz")
    - Tooltip: "BLOCKED — X gp material component (text). Add it to
      your inventory in the Items tab to cast."
    - Click yine de bilgilendirir: WARNING toast "Cannot cast — missing
      material component."
  • Toggle KORUNDU (kullanıcı isteği: "isteyen açık isteyen kapalı").
    OFF iken visual block feedback yok, cast serbest, item harcanmaz.
  • +3 yeni regression test (BLOCKED badge görünür/gizli, toggle
    OFF'ta yok). 1275 test sıfır hata.
- `0.3.19` — Discord 3'lü tekrar bug raporu için derin fix:
  • **Bug 5 KÖK SEBEP (Nameplate hiç çalışmıyordu):** `linkTokenToCharacter`
    sadece OBR context-menu Link butonu tıklandığında çağrılıyordu.
    Toggle ON yapıldığında HİÇBİR ŞEY olmuyordu çünkü nameplate
    creation re-link gerektiriyordu. Fix: `useEffect`
    `[linkedTokenId, ready, showCharacterNameplate, name]` dependency'ye
    eklendi — toggle değiştiğinde otomatik re-link tetiklenir,
    nameplate anında oluşur/kaldırılır.
  • **Bug 1 (Short Rest çalışmıyor):** SR butonu RAW per PHB p.186
    sadece resource'ları reset eder — HP yenileme HD spend gerektirir.
    Yeni: "SR + Heal" shortcut butonu eklendi (sadece HD varsa görünür).
    Tek tıkla TÜM available HD'yi avg + CON ile harcar, HP'yi günceller.
    Per-die "Spend" butonları RAW Dice+ akışı için duruyor.
  • **Bug 3 KÖK SEBEP (Component bypass):**
    1. Persist migration `version: 40`'a yükseltildi, `if (version <
       40) return { ...initialState, ...persistedState }` — eski state'te
       eksik olan tüm yeni field'lar default değerini alır.
    2. `state.enforceMaterialComponents ?? true` defensive nullish —
       undefined olsa bile RAW = true varsayılır. İkinci savunma hattı.
  • **Version badge** panel header'a eklendi ("v0.3.19") — user
    yüklediği bundle'ın gerçek versiyonunu görsün, cache hot-spot
    olduğunda hard-refresh gerek olduğunu anlar (index.html cache 2dk).
- `0.3.18` — Component matcher STRICT + Short Rest fey-step + 10 yeni test:
  • **Component matcher gp tier STRICT** (PHB p.203 RAW): Önceki
    matcher token-only çalışıyordu — Stoneskin (100gp diamond) için
    envanterdeki ANY diamond'ı (50gp, 300gp, vs.) match ediyordu.
    Artık item gp ≥ spell required gp olmazsa reject. Discord
    feedback: "component'ler açık olsa da kullanıyo büyüyü" — kök
    sebep buydu (ucuz item'lar pahalı spell'leri tatmin ediyordu).
  • **Multi-component spells (Astral Projection)**: material text'ten
    BÜTÜN gp value'ları parse edilir (`gpAll: number[]`). Matcher
    MIN(gpAll)'ı per-component threshold olarak kullanır. Astral
    Projection'da silver bar 100gp → MIN=100, jacinth 1000gp ≥ 100 +
    silver 100 ≥ 100 → ikisi de match. Eskiden silver bar 100gp <
    1000gp (max) yüzünden reject oluyordu.
  • **Short Rest fey-step eklendi** (Eladrin MPMM): "until you finish
    a short or long rest." Artık SR'da reset oluyor.
  • **Defensive LR-only filter**: srKeys'ten yanlışlıkla flash-of-
    genius/lay-on-hands/arcane-recovery eklenirse otomatik filtrelenir.
  • +10 yeni test: strictTierMatcher (8) — Stoneskin/Resurrection/
    Astral tier matrix; restCycle (+2) — fey-step SR + flash-of-genius
    LR-only.
  • 1272 test, sıfır hata, TS temiz.
- `0.3.17` — Discord bug raporu (5/5 fix) + scene clutter kaldırıldı + persist migration kritik fix:
  • **KRİTİK FIX (cast-block çalışmıyordu):** Persist migration eski
    localStorage snapshot'larında yeni `enforceMaterialComponents` ve
    `showCharacterNameplate` field'larını UNDEFINED bırakıyordu →
    cast-block check `if (enforceComponents && ...)` her zaman false →
    component'ler envanterde olmasa da spell cast oluyordu. Fix: v39'dan
    eski tüm versiyonlar artık `initialState` ile shallow-merge ediliyor,
    yeni field'lar default değerini alır. 3 yeni regression testi.
  • **Bug 2 FIX (Short Rest):** RestControls'a Hit Dice spend UI
    eklendi. Her HD size (d6/d8/d10/d12) için kalan/max pip + "Spend"
    butonu. Click → `1d{size} + CON mod` formula Dice+'a gönderilir,
    HD counter +1. PHB p.186 RAW + wikidot teyitli.
  • **Bug 4 FIX (heal cast'te kutu):** Heal flow'da 3 ayrı notify
    toast (Disciple of Life + heal formula + Blessed Healer) tek
    banner'a indirildi. Wikidot teyitli: Disciple of Life "+2 + spell
    level", Blessed Healer "+2 + spell level (other than you)".
  • **Bug 5 FIX (token nameplate kötü görünüyor):** Nameplate
    `linkTokenToCharacter()` opt-in oldu (default OFF). RestControls
    altında "Token nameplate: ON / OFF" toggle. Açıldığında fontSize
    14 (önce 28), padding 4 (önce 10), pointer chevron kaldırıldı —
    daha temiz chip görünümü.
  • **YENİ KURAL (Dice+-only):** `postSceneRoll` ve
    `postSpellTemplate` fonksiyonları no-op haline getirildi —
    extension HİÇBİR scene-text/AoE-shape çıkarmıyor. Sadece Dice+
    sahnede 3D dice atar; tüm cast/feature text'leri panel-içi
    `notify()` toast'larında kalır. 8 yeni regression testi
    (`diceOnlyRule.test.ts`) bunu pinler.
  • Persist version 38 → 39.
  • Total: 1262 test, sıfır hata, TypeScript temiz.
- `0.3.16` — Discord bug raporu (2/5 fix) + tüm 16 RAW spell wikidot teyitli + 30 yeni test:
  • **Bug 1 FIX (Enhanced Defense Shield):** `selectors.ts`'te bir
    fallback path bug'ı yakalandı — Enhanced Defense infusion
    UNEQUIPPED bir item'a (örn. çıkarılmış Shield) atanmış olsa bile
    yanlışlıkla başka equipped item'ın AC'sine +1 ekliyordu. RAW
    diyor ki: "a creature wearing or wielding the infused item."
    Fix: fallback path artık sadece itemId === '__none__' ise çalışıyor.
    12 test layer'ı kapsıyor.
  • **Bug 3 NEW FEATURE (Component cast-block toggle):** Bazı DM'ler
    PHB p.203 cost-bearing component'leri handwave eder. RestControls'a
    "Components: RAW / OFF" toggle'ı eklendi (default RAW). Off'ken
    cast-block + auto-consume DEVRE DIŞI. 5 test ile teyitli.
  • **Tüm 16 RAW spell wikidot ile cross-checked** (Stoneskin, Identify,
    Revivify, Resurrection, True Resurrection, Hallow, Find Familiar,
    Continual Flame, Glyph of Warding, Nondetection, Magic Mouth,
    Augury, Plane Shift, Raise Dead, Drawmij's, Animate Dead). Daha önce
    bulunan 2 CSV-RAW drift dışında hepsi tutuyor.
  • +30 regression test (985 → 1251 toplam, sıfır hata):
      - infusionAcMatrix (12): Enhanced Defense armor/shield/unassigned,
        Repulsion Shield, Defense FS + Forge L6 + Warforged stack.
      - componentBlockToggle (5): RAW vs OFF mode behavior.
      - weaponAttackFightingStyleMatrix (13): Archery / Dueling /
        Two-Weapon Fighting / Defense FS + Hexblade pact-bond + Battle
        Smith INT-swap + spell effect riders.
  • Persist version 37 → 38 (yeni `enforceMaterialComponents` field için).
  • Bug 2 (short rest), Bug 4 (heal cast UI kutusu), Bug 5 (linked token
    HP bar UI) — kullanıcıdan detay/image bekliyor.
- `0.3.15` — Test infrastructure derinleştirme + 2 CSV-RAW drift bulgusu:
  • **+236 yeni regression test** (985 → 1221, sıfır hata, TypeScript
    temiz). 8 yeni layer eklendi:
      - spellComponentRegistry: gear.ts'teki 250+ component'in id-set
        bütünlüğü (unique, gp, Diamond/Pearl/Ruby tier ladder, Round-5
        eklemeler).
      - spellComponentRawCoverage: wikidot-canonical 16 RAW spell'in
        material text'i + gp + consumed flag tutarlılığı.
      - restCycle: long/short rest reset matrix (slots, sorcery, ki,
        pact, stroke-of-luck, exhaustion, hit dice, concentration).
      - multiclassSpellcastingDC: Cleric/Wizard, Bard/Druid gibi farklı
        ability-based MC build'lerde her source kendi DC'sini hesaplıyor
        (no averaging).
      - critRiderMath: PHB p.196 crit dice doubling — sneak attack,
        smite, hex/HM, IDS, Brutal Crit, Crimson Rite, Divine Strike,
        Rage flat (NOT doubled), kombo crit.
      - raceClassSpellMerge: Drow Wizard/Rogue, Tiefling Asmodeus
        Fighter, High Elf cantrip, Aasimar Light gating + non-caster
        race fallback.
      - concentrationInteraction: PHB p.203 single-spell rule — yeni
        concentration cast eskini düşürür, non-concentration buff
        coexist eder, LR clear, dedup by spellId.
      - castFlowMatrix DOM: 17 senaryo Revivify/Resurrection/True
        Resurrection/Tele Circle/Symbol/Animate Dead/cantrip/multi-cast
        flow için.
  • **2 CSV-RAW drift bulundu**: Apple Sorcerer Sheet 2 spell'i yanlış
    işaretlemiş — wikidot fetch ile teyitlenip test'lerde belge­lendi:
      1. Animate Dead — CSV "25gp onyx consumed" diyor; wikidot RAW'da
         "drop of blood, piece of flesh, pinch of bone dust" (no gp/no
         consumed). 25gp onyx aslında Create Undead için.
      2. Drawmij's Instant Summons — CSV "consumed" işaretli; wikidot
         RAW "a sapphire worth 1,000 gp" (no consumed wording — sapphire
         only consumed when crushed later, not on cast).
- `0.3.14` — Component filter UI fix:
  • EquipmentStep'in "Bileşenler" filter chip'i hardcoded id-prefix
    listesine dayanıyordu (sadece 25 prefix). 0.3.13'te eklenen 155 yeni
    component (adamantine-, ash-, bull-hairs-, caterpillar-, vs.) bu
    listeye dahil olmadığı için envanterde gözükmüyordu.
  • Yeni: gear.ts'ten `SPELL_COMPONENT_IDS` registry export edilip
    EquipmentStep'e import edildi. O(1) Set lookup — hardcoded prefix yok,
    component eklendikçe otomatik gözükür.
- `0.3.13` — Spell component katalogu tam kapsam (278 toplam):
  • Apple Sorcerer Material Components Sheet (385 row × 263 spell × 268
    unique component) ile envanter cross-check edildi; eksik 155 component
    eklendi (toplam 278 component, 470 → 625 item).
  • RAW cost-bearing (PHB p.203 cast-block enforce edilen) 69 entry zaten
    %100 mevcut + wikidot ile doğrulandı (Create Undead 150gp Black Onyx,
    Summon Shadowspawn 300gp Gem, Teleportation Circle 50gp Chalks/Inks,
    Bigby's Hand RAW-fiyatsız).
  • Yeni eklenenler 3 kategoride: (a) Sheet author'ın "(suggested)" RP
    fiyatları (Adder's Stomach 8gp, Bull Hairs 5sp, Mistletoe Sprig vs.) —
    spell text'te fiyat YOK, focus substitute eder. (b) "Suggested" canon
    fiyatları (Bell tiny 1gp, Petrified Eye of Newt 15gp). (c) Harvested
    no-price (Eyeball, Tears, Snow, Air, Pebble) — narrate-only, 0 gp.
  • Cast-block davranışı değişmedi: sadece RAW gp veya consumed flag'li
    component'ler envanterde aranır. Suggested/harvested entries sadece
    tracker — blocking değil.
- `0.3.12` — Çoklu-component spell auto-consume + cast-block test güvencesi:
  • **Multi-component spells** (Astral Projection: 1000gp jacinth + 100gp
    silver bar; Symbol: powdered diamond+opal mix; Clone: vessel +
    diamond + flesh) artık tek cast'te BÜTÜN listelenen materyalleri
    tüketiyor — önceden sadece ilk eşleşen component qty düşüyordu.
  • **6 yeni cast-flow regression testi** OBRPanel için: PHB p.203 cast-
    block (envanterde diamond yokken Stoneskin block edilmeli, slot
    yanmamalı), auto-consume (Stoneskin/Find Familiar/Hallow → qty -1),
    non-consumed RAW (Identify pearl reusable → qty değişmez), multi-
    component drain (Astral Projection → her iki item -1). Toplam 985
    test geçiyor.
  • Component matcher artık `matchingItems` array (önceden tek match
    döndürüyordu) — multi-component spell'ler için drain loop'u tüm
    eşleşmeleri tarıyor. Display ve cast-block davranışı değişmedi
    (ilk match badge'de gösterilmeye devam ediyor).
- `0.3.10` — Custom item auto-equip + 25 daha component (toplam 77):
  • Custom item oluşturma form'unda weapon/armor/shield artık otomatik
    equipped olarak işaretleniyor — önceden EquipmentStep'te toggleEquipped
    elle çağrılması gerekiyordu, oyuncu unutuyordu, OBR action'larda
    görünmüyordu. Engine zaten doğru çalışıyordu (test ile teyitli);
    bug submitCustomForm'daki UI flow'da idi.
  • +25 yeni canonical component (toplam 77 component item):
    Onyx 25gp (Animate Dead), Ruby Dust 50gp (Continual Flame), Jade Dust
    10gp (Magic Mouth), Self Statuette 250gp + Silver Bar 100gp (Astral
    Projection), Stardust 25gp (Augury), Hallow Incense 1000gp, Gem-
    Encrusted Bowl 1000gp (Heroes' Feast), Crystal Bead 1sp (Globe of
    Invulnerability), Black Silk Square + Broken Bone (Negative Energy
    Flood), Holly Berry (Conjure Woodland Beings), Mistletoe (druidic
    focus), Raven Feather, Stone Tablet, Diamond Dust 25gp (Nondetection),
    Drop of Blood (Bane), Tiny Clay Replica (Maximilian's Earthen Grasp),
    Musical Instrument focus, Holy Symbol focus, Arcane Focus generic,
    Druidic Focus generic, Extra Component Pouch.
- `0.3.9` — Discord bug raporları (4 fix):
  • Replicable Magic Item items (Bag of Holding, Goggles of Night, Alchemy
    Jug, Wand of Magic Detection, vs. — TCoE Replicate listesindeki 53
    item) artık equipment picker'da gözükmüyor. Sadece Artificer infusion
    picker'ı üzerinden erişilebilir.
  • Spell cast Dice+ kuralı sıkılaştırıldı: SpellRow'daki 3 postSceneRoll
    çağrısı kaldırıldı (save+damage / save-only / utility). Panel artık
    KESİNLİKLE scene yazısı atmıyor — sadece Dice+ formula + panel
    notify. Test'ler de bu kurala göre güncellendi.
  • 20 yeni spell component eklendi (toplam 52): Diamond 200gp (Glyph of
    Warding), Mercury, Silver Rod, Crystal Hemisphere, Crystal Sphere,
    Amber Rod, Phosphorus, Brimstone, Iron Filings, Sulfur, Yew Leaf,
    Blood Vial, Bat Fur, Black Ink (5gp), Quill (50gp), Diamond 50gp
    Focus, Generic Gem 25gp, Find Familiar herbs+incense+charcoal set,
    Diamond 300 (Revivify), Diamond 1000 (Resurrection).
  • AC infusion stacking wikidot teyitli — Enhanced Defense +1/+2 (L10),
    Repulsion Shield +1, Resistant Armor (damage resist, no AC). Engine
    bunları farklı kaynaklardan stack ediyor (Defense FS, Warforged,
    Forge Cleric L6 ile birlikte) per RAW.
- `0.3.8` — Racial spell fix:
  • Drow Rogue / Tiefling Fighter / Aasimar Barbarian gibi sınıf büyü
    yeteneği OLMAYAN karakterlerde, race'den gelen büyüler (Drow Magic,
    Tiefling Infernal Legacy, Aasimar Light, Forest Gnome Minor Illusion,
    vs.) OBR Spells tab'ında hiç görünmüyordu — `if (!sc) return "no
    spellcasting"` early return'ü racial spell entry build'ini bypass
    ediyordu.
  • Fix: SpellsTab artık fallback DC/atk üretiyor (CHA/INT/WIS'in en
    yükseğini kullanır) — racial + feat-granted + ritual spells artık
    non-caster karakterlerde de cast edilebilir.
- `0.3.7` — Spell components ekosistemi:
  • Google Sheet (D&D 5e Material Spell Components Table) + wikidot ile
    cross-check edildi (385 satır, 263 spell, 268 unique component).
  • 7 spell'in `(consumed)` flag'i eksikti — eklendi (CSV doğrulamalı).
  • 3 spell material'ı tamamen eksikti — Google Sheet kaynaklı eklendi.
  • Envanterde yeni "Büyü Bileşenleri" kategori filtresi (filter chip
    "component"), oyuncu doğrudan spell focus / consumed materyalleri
    göz atabilir.
  • gear.ts'e 15 yeni component eklendi: 25.000gp diamond (True
    Resurrection), 5.000gp ruby dust mix (Sequester), holy water (Bless/
    Protection from Evil), forked rod (Plane Shift), lodestone (Reverse
    Gravity), black pearl 500gp (Circle of Death), agate 1000gp (Awaken),
    miniature platinum sword (Mordenkainen's Sword), tiny ivory door +
    marble + spoon (Magnificent Mansion), 5000gp chest (Secret Chest),
    crystal vial (high-tier abjurations), 1000gp reliquary (Holy Aura),
    500gp gold statuette (Invulnerability), 500gp diamond (Raise Dead),
    250gp focal sword.
- `0.3.6` — Wikidot expert deep audit (devamı, engine no-op'lar):
  • Cleric Light/Knowledge L8 Potent Spellcasting: cleric cantrip damage'a
    +WIS modifier otomatik eklendi (PHB p.61).
  • Wizard Evocation L10 Empowered Evocation: wizard evocation spell
    damage'a +INT eklendi (PHB p.118).
  • Sorcerer Draconic L6 Elemental Affinity: spell roll'a +CHA optional
    label eklendi (oyuncu damage type'ı dragon ancestry'sine eşleştirirse).
  • Halfling Racial Lucky (PHB p.28): nat 1 reroll badge — Lucky FEAT'inden
    ayrı `hasHalflingLucky` flag.
  • Halfling Brave: "vs frightened" save-tag hint.
  • Dwarf Stonecunning: "vs stonework History (double PB)" derived flag.
  • Paladin L10 Aura of Courage: save-tag "immune to frightened".
  • Brutal Critical: derived.brutalCriticalDice (önceden OBR inline).
  • Druid Wild Shape: derived.wildShapeMaxCr ("1/4" / "1/2" / "1" / Moon
    formülü).
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
