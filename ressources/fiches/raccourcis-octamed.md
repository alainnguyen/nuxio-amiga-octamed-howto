# Fiche raccourcis OctaMED 4.03

**Version :** 4.03 (A600, relevé 2026-08-19)
**Statut de vérification A1200 :** ⬜ non fait — version A1200 inconnue

Colonne *source* : `ext` = liste externe, **non vérifiée sur la machine** ·
`test` = confirmé par manipulation · `menu` = lu dans un menu.

> Tout ce qui est marqué `ext` est à confirmer d'un doigt en passant. Une seule
> ligne fausse coûte plus de temps qu'elle n'en fait gagner.

---

## Priorité 1 — le noyau du critère FORM-01

Les six raccourcis qui suffisent à saisir et jouer un bloc.

| Fonction | Raccourci | Source |
|---|---|---|
| **Mode enregistrement ON/OFF** | `Esc` | ext |
| Notes | clavier piano deux rangées | ⬜ à relever |
| **Retour début de bloc** | `F6` ou `Alt gauche + ↑` | ext / **test** |
| **Jouer le bloc** | `Amiga + Espace` | ext |
| Instrument précédent / suivant | `Shift + ←` / `→` | ext |
| **Piste précédente / suivante** | `Alt + ←` / `→` | **test** |
| Bloc précédent / suivant | `Shift + ↑` / `↓` | ext |

---

## Lecture — matrice à deux axes

|  | Depuis le début | Depuis le curseur |
|---|---|---|
| **Morceau** | `Amiga + P` | `Shift + Espace` |
| **Bloc** | `Amiga + Espace` | `Alt + Espace` |

Source : ext.

Combo utile : `F6` puis `Shift + Espace` — repartir du début du bloc courant
en jouant le **morceau**, pour entendre un segment dans son contexte de séquence.

---

## Copier / couper / coller — matrice de portée

| Portée | Raccourci |
|---|---|
| Une piste dans un bloc | `Amiga + X / C / V` |
| Bloc entier | `Amiga + Shift + X / C / V` |
| Plage marquée | `Ctrl + X / C / V` |

Source : ext. **Comment marquer une plage : ⬜ à relever.**

---

## Navigation dans le bloc

| Position | Touche |
|---|---|
| Début | `F6` |
| 25 % | `F7` |
| 50 % | `F8` |
| 75 % | `F9` |
| Dernière ligne | `F10` |

Source : ext.

---

## Menus

Le bandeau est groupé en colonnes de 5, calquées sur les deux blocs de touches F.

| Raccourci | Menu |
|---|---|
| `Ctrl + F1` | Files |
| `Ctrl + F2` | Play |
| `Ctrl + F3` | Instr |
| `Ctrl + F4` | ⬜ |
| `Ctrl + F5` | ⬜ |
| … | jusqu'à **Range** |

⬜ Compléter la liste des titres — elle sert à retrouver n'importe quelle
fonction manquante sans fouiller.

---

## Séquence du morceau (utile en FORM-05)

| Fonction | Raccourci |
|---|---|
| Curseur séquence, un bloc plus bas | `Ctrl + Pavé 2` |
| Curseur séquence, un bloc plus haut | `Ctrl + Pavé 8` |
| **Insérer le bloc courant dans la séquence** | `Ctrl + Pavé 5` |

Source : ext. C'est avec ça que se construit la séquence du §11.2 — y compris
l'insertion des **blocs vides** là où une machine ne joue rien.

---

## Mémoires de saisie — le mécanisme central pour la jungle

| Fonction | Raccourci |
|---|---|
| Mémoriser note + instrument + commande sous le curseur | `Ctrl + Shift + 1…9` |
| Rappeler la mémoire à la position du curseur | `Shift + 0…9` |

Source : ext.

**C'est le raccourci le plus important de la liste pour ton matériau.** Une
tranche de break est un triplet note + instrument + commande d'offset
(ex. `C-3 01 191F`). Le retaper à chaque occurrence est lent et source d'erreur ;
neuf mémoires permettent de rejouer un découpage de break comme on tape un motif.

Conséquence pour FORM-03 : la stratégie **1 sample + offset** devient nettement
plus praticable que la découpe destructive, sans rien coûter en chip ni en
numéros d'instruments. À confirmer à l'usage, mais ça penche fortement.

---

## Pas d'avance (SPC) — résolu

| Fonction | Où / raccourci | Source |
|---|---|---|
| Régler la valeur du pas | Menu **Edit → SPC**, valeur numérique | **test** |
| Basculer entre pas = SPC et pas = 1 | `` ` `` / `~` (même touche physique) | **test** |

Ceci lève l'ambiguïté de la liste externe : « space mode toggle » désigne le
**spacing**, pas la barre d'espace.

**Usage pour le matériau jungle :**

| Phase | Pas | Geste |
|---|---|---|
| Squelette (kick aux temps) | SPC = 4 | 4 frappes, aucun déplacement de curseur |
| Edit de break, roulements | 1 | `` ` `` pour basculer, sans quitter le clavier |

La valeur de SPC dépend du LPB, qui se décide en FORM-02. Avec LPB = 4,
SPC = 4 donne un pas d'un temps. À refixer si le LPB change.

**Attention clavier :** noter la **position physique** de la touche `` ` `` —
sur un clavier AZERTY elle n'est pas là où une doc anglophone la place.

---

## Divers

| Fonction | Raccourci |
|---|---|
| Saisie du nom d'instrument | `Amiga + I` |
| Insérer des lignes vides dans le bloc | `Shift + Backspace` |
| Bascule « space mode » | `` ` `` — voir section SPC ci-dessus |

---

## Encore à relever

Grille FORM-01, entrées non couvertes par la liste externe :

- Déplacement du curseur ligne à ligne, champ à champ
- `Alt gauche + ↓` : fin de bloc ? (symétrie attendue avec `Alt + ↑`)
- Octave courante : affichage et changement
- Effacer une note / une ligne entière
- Note-off / key-off
- **Undo : existe ? profondeur ?**
- Marquage d'une plage
- Transposition d'une plage
- Bouclage du bloc en lecture
- Longueur de bloc, tempo, LPB, nombre de pistes *(localiser, ne pas modifier)*

---

## Notes de relevé

_Écarts constatés entre la liste externe et la machine._
