# §12 — Formation OctaMED : état

**Addendum au brief « Setup live Amiga » v2 — août 2026**
Dernière mise à jour : **2026-08-19, fin de FORM-01**

---

## 12.1 Avancement

| # | Étape | Critère de sortie | Statut |
|---|---|---|---|
| 0 | Socle : version, `Avail`, chronos | Les 4 relevés dans `ressources/releves/` | 🟡 partiel |
| 0b | Archive de référence A600 (TASCAM) | 4 prises + gain noté | ⬜ |
| 1 | Navigation et saisie | Bloc kick+hat 16 pas < 3 min, ×2, sans manuel ni souris | ✅ |
| 2 | Grille temporelle | BPM/LPB/longueur figés + `TEMPLATE_MASTER.med` | 🟡 |
| 3 | Samples, décimation, découpe de break | Break importé + 2 variations < 30 min | ⬜ |
| 4 | Commandes d'effet | Fiche relevée dans *sa* version | ⬜ |
| 5 | Structure §11.2 | Squelette 8 blocs, aucun saut, aucun bloc court | ⬜ |
| 6 | Maquette 8 pistes | Morceau 1 en mixage logiciel | 🔒 A1200 |
| 7 | Split | Checklist exécutée < 2 min, zéro décision | ⬜ à blanc |
| 8 | MIDI maître / esclave | Config OctaMED des deux côtés | 🔒 §7 + §8.1 |
| 9 | Chargement, relais, jeu | Procédure de scène | 🔒 §8 + §11.7 pt 1 |

Légende : ⬜ à faire · 🟡 en cours · ✅ critère atteint · 🔒 bloqué

---

## 12.2 Relevés

| Mesure | Valeur | Source | Date |
|---|---|---|---|
| OctaMED — version A600 | **OctaMED Professional 4.03** (readme, build précis — barre de titre : v4.00). `Version` sur le binaire si arbitrage nécessaire | readme | 2026-08-19 |
| Tempo : mode BPM ↔ SPD commutable | **Oui, confirmé.** SPD 033/06 ↔ BPM 033/08 | écran | 2026-08-19 |
| BPM réel correspondant à la valeur affichée | — **sortie du TP FORM-02, pas une décision** | — | — |
| OctaMED — version A1200 | — **à confirmer : si ≠ 4.03, risque de format** | readme / `Version` | 🔒 |
| OctaMED Pro 4.03 — réception SPP proposée ? | — | page prefs MIDI | — |
| Chip RAM A600, colonne *maximum* | **1 047 552 o (1023 Ko) — 1 Mo confirmé** | `Avail` | 2026-08-19 |
| Fast RAM A600 | **0 — confirmé** | `Avail` | 2026-08-19 |
| Chip *available*, WB seul, OctaMED non lancé | 668 528 o (653 Ko) | `Avail` | 2026-08-19 |
| Chip *largest*, WB seul — **plafond d'un sample unique** | 654 544 o (639 Ko) | `Avail` | 2026-08-19 |
| Surcoût système + WB (*in-use*) | 379 024 o (370 Ko) | `Avail` | 2026-08-19 |
| Chip *largest*, OctaMED chargé, morceau vide | **214 496 o (209 Ko)** — *available* 239 832 o (234 Ko), *in-use* 807 720 o | `Avail` | 2026-08-19 |
| Coût d'OctaMED seul (delta *in-use*) | **428 696 o (419 Ko)** — anormalement élevé, à décomposer | calcul | 2026-08-19 |
| Idem, boot sans Workbench | — | `Avail` | — |
| Idem, par mode d'écran testé | — | `Avail` | — |
| Boot A600, froid → Workbench | — | chrono | — |
| Chargement CF A600 (3 mesures + Ko) | — | chrono | — |
| Chargement CF A1200 | — | chrono | 🔒 |
| Gain d'entrée TASCAM de référence | — | position notée | — |
| Niveau max sortie A600 (dBFS) | — | prise 1 | — |

---

## 12.3 Conventions figées

Une convention entre ici quand elle est décidée. Elle n'en sort plus sans
décision explicite tracée en commit.

| Objet | Décision | Étape |
|---|---|---|
| **Méthode de travail : pas d'undo** | **OctaMED 4.03 n'a pas d'undo (vérifié 19/08).** Snapshot au presse-papier de bloc (`Amiga+Shift+C`) avant toute opération destructive ; sauvegarde incrémentale numérotée | 1 |
| **Pas d'avance (SPC)** | Menu `Edit → SPC` = valeur numérique ; `` ` `` bascule entre SPC et 1. Poser `SPC = LPB` une fois le LPB figé | 1 |
| BPM | — **hérité du break, sortie du TP 2.1-bis** | 2 |
| LPB (lignes par temps) | — *(observé à 8 dans le fichier courant, non figé)* | 2 |
| Longueur de bloc par défaut | — **entier de mesures, non négociable** (le RE-303 boucle à la mesure) | 2 |
| Note de référence du break | — **à figer au TP, conditionne tout le mapping note↔hauteur** | 2 |
| Taux d'échantillonnage des breaks | — *(3 candidats préparés : 11 / 16,7 / 22 kHz)* | 2–3 |
| Décimation des samples | — | 3 |
| Découpe : offset vs destructive | — **penche fortement vers offset** (mémoires `Ctrl+Shift+1-9` + budget de 30 instruments) | 3 |
| Filtre LED A600 : où et comment | — | 0b |

---

## 12.4 Remontées au brief principal

Ce que la formation a produit et qui modifie les §1–11.

| Cible | Effet | Statut |
|---|---|---|
| §8 pt 4 — chip RAM réelle de l'A600 | **Fermé : ~1 Mo confirmé.** L'extension à 2 Mo est nécessaire — le choix de la carte reste ouvert (§7) | ✅ |
| §11.7 pt 1 — chrono chargement CF | À moitié fermé (A600 seul) | ⬜ |
| §11.6 — substitution décimé → définitif | **Correction : décimer change le mapping note↔hauteur. La substitution telle qu'écrite casse toutes les hauteurs, silencieusement.** Convention à figer étape 3 | 🔴 à corriger |
| §11.1 — procédure de split | **Sans undo, « dupliquer le master » cesse d'être une précaution : c'est la seule barrière.** Une suppression de 4 pistes lancée sur le master est irréversible. À inscrire en tête de la checklist FORM-07 | 🔴 nouveau |
| §5 — comportement au démarrage à froid | Le filtre LED ne persiste pas au boot : à intégrer, identique sur les deux machines | ⬜ |
| §7 — arbitrage vidéo A600 | **Sortie composite native jugée exploitable** (19/08, conditions vacances). Rouvre l'option « extension RAM 35 € maintenant, v3 plus tard ». À confirmer sur l'écran de scène réel | 🟡 |
| §3 / §8.1 — SPP en réception | **OctaMED 4.03 est antérieur aux Pro V5/V6 et à SoundStudio. Que sa page MIDI propose la réception du Song Position Pointer n'est pas acquis.** Sans SPP, le seul avantage du maître A1200 sur le maître RE-303 disparaît | 🔴 nouveau, critique |
| §3 — boucles de masse | **Nouveau chemin de masse** : un écran relié en composite RCA relie l'A600 à cet écran. À intégrer à l'inventaire selon l'alimentation de l'écran | 🔴 nouveau |

---

## 12.5 Dépendances non levées

Rien de ce document ne suppose acquis :

- la stabilité de la synchro MIDI (§3) — non testée ;
- l'arbitrage maître A1200 / RE-303 (§8.1) — **si ça bascule vers le 303, le §11.2 est à réécrire et l'étape 5 avec** ;
- l'hypothèse « samples en fast RAM » (§11.6) — intestable sur A600 ;
- les interfaces MAX3232 (§7) — non construites.

---

## 12.6 Règle de la période sans A1200

**Ce qui s'écrit maintenant, ce sont des études, pas du répertoire.**

4 voix au lieu de 8, 1 Mo de chip au lieu de 2, timbre A600 stock : référence
d'écoute fausse *et* format faux. Le rendement est dans les artefacts
transportables — fiches, template, checklist, chronos, prises de référence —
pas dans les ébauches de morceaux.

---

## 12.7 Reprise — état au 19/08 fin de FORM-01

### Acquis exploitables

- Noyau de raccourcis relevé et automatisé, fiche dans `ressources/fiches/`
- Grammaire des modificateurs : **Shift = change de contexte** (instrument ←→,
  bloc ↑↓) · **Alt = position dans le contexte courant** (piste ←→, début de
  bloc ↑). Cohérent avec `Alt+Espace` = jouer depuis le curseur.
- Budget chip réel : **209 Ko contigus** avec OctaMED chargé.

### Écarté volontairement

- Décomposition des 419 Ko d'OctaMED (piste : `CH.MODE` doit rester sur 4)
- Calibration BPM au chronomètre — remplacée par le TP au break
- Chronos boot / chargement CF — **à faire tant que la machine est là**

### En cours : FORM-02

Break Amen en préparation sur le Mac via
`ressources/scripts/prep-break.sh` (8 bits **signé**, mono, `-D`, nommage 8.3).
Trois taux produits pour comparaison.

Contrainte structurante : **plafond Paula ~28,8 kHz en PAL**. Accélérer un break
par transposition monte aussi la hauteur et bute vite ; le tempo se règle par
**découpe et redéclenchement**, pas par transposition.

Prochain geste : TP 2.1-bis — break entier, note figée, tempo variable jusqu'à
bouclage sans couture.
