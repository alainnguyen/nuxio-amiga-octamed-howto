# §12 — Formation OctaMED : état

**Addendum au brief « Setup live Amiga » v2 — août 2026**
Dernière mise à jour : _(à renseigner à chaque commit)_

---

## 12.1 Avancement

| # | Étape | Critère de sortie | Statut |
|---|---|---|---|
| 0 | Socle : version, `Avail`, chronos | Les 4 relevés dans `ressources/releves/` | ⬜ |
| 0b | Archive de référence A600 (TASCAM) | 4 prises + gain noté | ⬜ |
| 1 | Navigation et saisie | Bloc kick+hat 16 pas < 3 min, ×2, sans manuel | ⬜ |
| 2 | Grille temporelle | BPM/LPB/longueur figés + `TEMPLATE_MASTER.med` | ⬜ |
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
| OctaMED — chaîne de version A600 | — | menu About | — |
| OctaMED — chaîne de version A1200 | — | menu About | 🔒 |
| Chip RAM A600, colonne *maximum* | — | `Avail` | — |
| Fast RAM A600 | — | `Avail` | — |
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
| BPM | — | 2 |
| LPB (lignes par temps) | — | 2 |
| Longueur de bloc par défaut | — | 2 |
| Décimation des samples | — | 3 |
| Découpe : offset vs destructive | — | 3 |
| Filtre LED A600 : où et comment | — | 0b |

---

## 12.4 Remontées au brief principal

Ce que la formation a produit et qui modifie les §1–11.

| Cible | Effet | Statut |
|---|---|---|
| §8 pt 4 — chip RAM réelle de l'A600 | Fermé par `Avail` étape 0 | ⬜ |
| §11.7 pt 1 — chrono chargement CF | À moitié fermé (A600 seul) | ⬜ |
| §11.6 — substitution décimé → définitif | **Correction : décimer change le mapping note↔hauteur. La substitution telle qu'écrite casse toutes les hauteurs, silencieusement.** Convention à figer étape 3 | 🔴 à corriger |
| §5 — comportement au démarrage à froid | Le filtre LED ne persiste pas au boot : à intégrer, identique sur les deux machines | ⬜ |
| §7 — arbitrage vidéo A600 | Une solution d'affichage existe hors Paris ; à documenter, peut débloquer l'option « RAM 35 € maintenant, v3 plus tard » | ⬜ |

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
