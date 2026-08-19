# FORM-00 — Socle : version, `Avail`, chronos

**Machine :** A600 seule, 1 Mo chip supposé, 68000 stock.
**Prérequis :** aucun. **Coût :** 0 €. **Durée :** ~1 h.
**Produit :** 4 relevés dans `ressources/releves/`, 2 points ouverts du brief fermés.

Aucune note n'est écrite dans cette étape. C'est de la mesure.

---

## 0.1 — Version exacte d'OctaMED

Relever la **chaîne complète** affichée dans About/Info, pas « v4 ».

Ce qui en dépend :

| Conséquence | Pourquoi |
|---|---|
| Fiche commandes d'effet (FORM-04) | Les numéros diffèrent entre MED, OctaMED Pro et SoundStudio |
| Format de sauvegarde | MMD2 (Pro) vs MMD3 (SoundStudio) — compat entre les deux machines |
| Taux de mixage logiciel | §11.3 le note explicitement comme non tranché |

**À refaire sur l'A1200 au retour.** Si les deux chaînes diffèrent, la fiche
commandes est à re-vérifier et la compat de format à tester avant tout split.

---

## 0.2 — `Avail`

Depuis un Shell :

```
Avail
```

Relever les colonnes pour `chip` et `fast`. **La colonne qui compte est
*maximum*, pas *available*** : c'est elle qui dit la chip physiquement
installée, indépendamment de ce que le système occupe déjà.

| Lecture | Conclusion |
|---|---|
| chip maximum ≈ 1 048 576 | 1 Mo confirmé — **§8 pt 4 fermé**, commande d'extension validée |
| chip maximum ≈ 524 288 | 512 Ko : l'A600 est plus pauvre que supposé, le §7 change de chiffrage |
| chip maximum ≈ 2 097 152 | Déjà 2 Mo — l'extension est inutile, ~35 € économisés |

Noter aussi `fast` : attendu à 0. Si ce n'est pas 0, dire lequel — ça change
ce qu'on peut tester ici.

Le test `Avail` avant/après chargement du §11.6 (hypothèse samples en fast RAM)
**ne se fait pas ici** : sans fast RAM, la question n'a pas de sens sur cette
machine. Il reste ouvert jusqu'à Paris.

---

## 0.3 — Chrono de boot

Trois mesures, départ à froid (machine éteinte, pas de reset).

Top départ à l'interrupteur, arrêt quand OctaMED est **utilisable**, pas quand
le Workbench apparaît. C'est le temps qui compte en scène.

Noter aussi le temps intermédiaire jusqu'au Workbench : si l'écart est gros,
c'est le chargement d'OctaMED qui coûte, et il est optimisable.

---

## 0.4 — Chrono de chargement CF

**C'est la mesure la plus utile de l'étape.** Le §11.7 point 1 (granularité des
modules : 1 mod = 1 set / 1 morceau / relais décalé) est bloqué dessus, et cette
décision détermine la forme du set entier.

Protocole :

1. Charger un mod dont la **taille en Ko est notée**.
2. Top départ au validate du requester de chargement.
3. Arrêt au retour de l'éditeur.
4. Trois mesures. Puis **recommencer avec un mod de taille nettement différente**.

Deux tailles donnent une droite : un coût fixe (accès, parsing) plus un débit
en Ko/s. Une seule taille ne donne rien d'extrapolable, et c'est justement
d'extrapolation qu'on a besoin pour arbitrer le §11.7.

**Ce chrono ne ferme pas le point 1** — il en manque la moitié (A1200 + PiStorm,
donc probablement un tout autre débit). Mais il donne le pire cas, et en
fiabilité scénique c'est le pire cas qui décide.

---

## 0.5 — Archive de référence A600 (FORM-00b)

À faire dans la foulée, **avant toute écriture**, et à ne plus jamais refaire.

**Condition de validité : le gain d'entrée du TASCAM est noté et ne bouge plus.**
Une référence dont le gain n'est pas reproductible ne vaut rien. Refaire la
prise 1 en tête de chaque session pour vérifier la dérive.

| # | Prise | Ce qu'on en tire |
|---|---|---|
| 1 | Sinus, volume instrument 64, master max | Niveau max de sortie A600 en dBFS → comparaison chiffrée avec l'A1200 |
| 2 | Un break, filtre LED **ON** | Arbitrage du filtre |
| 3 | Le même break, filtre LED **OFF** | idem |
| 4 | Le même break, définitif vs décimé | Coût réel de la décimation, mesuré et non supposé |

Sur le filtre LED : à vérifier s'il se règle depuis les préférences OctaMED ou
par un utilitaire CLI — *je ne l'affirme pas*. Dans tous les cas **il ne persiste
pas au boot**, donc c'est une ligne de startup-sequence ou une case de config,
identique sur les deux machines (§5, démarrage à froid).

Les fichiers audio vont dans `ressources/audio/`, **hors git**. Seules les
valeurs relevées entrent dans `ressources/releves/`.

---

## Critère de sortie

`ETAT.md` §12.2 rempli, sans tiret restant sur les lignes A600.
Commit : `FORM-00: socle relevé`.

## Ce qui se débloque ensuite

FORM-01 (navigation et saisie) ne dépend d'aucun de ces relevés — il peut
démarrer en parallèle. FORM-03 (samples) dépend de 0.2 et de la prise 4.
