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
