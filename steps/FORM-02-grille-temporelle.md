# FORM-02 — Grille temporelle

**Machine :** A600 seule. **Prérequis :** FORM-01. **Coût :** 0 €.
**Produit :** BPM, LPB et longueur de bloc figés + `TEMPLATE_MASTER.med`.

C'est la décision la moins réversible de la formation. Elle doit être
**identique des deux côtés** (§11.2) et elle est verrouillée par le template.
La changer après trois morceaux écrits, c'est réécrire les trois.

---

## 2.0 Vérification préalable — l'unité de tempo

**À faire avant toute décision.** OctaMED a connu deux représentations du
tempo : l'unité MED historique et un mode BPM avec LPB. Laquelle 4.03 affiche,
et sont-elles commutables ?

Regarder le champ de tempo et le champ LPB dans l'interface, et le menu de
réglage du morceau. Noter :

- Le tempo s'exprime-t-il en BPM lisibles, ou en unités MED ?
- Le LPB est-il un champ modifiable, et quelles valeurs accepte-t-il ?
- Y a-t-il un mode à commuter pour passer de l'un à l'autre ?

Si le tempo est en unités MED, la conversion vers un BPM réel est à établir
**avant** de décider quoi que ce soit — sans quoi la valeur écrite dans le
template ne veut rien dire, et le RE-303 suivra un tempo qu'on ne sait pas nommer.

---

## 2.1 Les trois décisions

### BPM — ce n'est pas une décision

**Correction de méthode.** En jungle, le tempo n'est pas un paramètre libre : il
est hérité du break, puis retendu par le découpage. Choisir un BPM puis y plaquer
un break, c'est l'ordre inverse du matériau.

Le BPM devient donc une **sortie** du TP ci-dessous, pas une entrée du template.
Le RE-303 suit le clock et ne contraint rien.

---

## 2.1-bis TP — le break donne le tempo

Résout la correspondance SPD ↔ BPM ↔ tempo réel sans chronomètre, et sert
directement FORM-03.

**Deux variables gouvernent la vitesse de lecture : la note jouée et le tempo
du bloc.** On en fige une, on fait varier l'autre. Sinon on tourne en rond.

| # | Action |
|---|---|
| 1 | Choisir un break, noter sa longueur en mesures (1, 2 ou 4) |
| 2 | Le charger **en un seul sample**, pas encore découpé |
| 3 | Longueur de bloc = N mesures × lignes/mesure |
| 4 | **Figer une note de référence** (ex. `C-3`) et ne plus en changer |
| 5 | Déclencher le sample à la ligne 0, une seule fois |
| 6 | Lecture du bloc en boucle |
| 7 | Faire varier le **tempo seul** jusqu'à ce que la boucle soit sans couture |
| 8 | Relever la valeur affichée **dans les deux modes** — c'est la paire de conversion |

La couture s'entend au point de bouclage : trou = tempo trop lent, troncature =
tempo trop rapide. Au TASCAM si le doute persiste.

**Sorties à inscrire au §12.3 :**

- la note de référence du break — elle conditionne tout le mapping note↔hauteur
  (cf. correction du §11.6) ;
- le tempo, dans les deux unités ;
- le BPM réel, s'il diffère de la valeur affichée.

Une fois ces trois valeurs posées, le découpage en tranches de FORM-03 tombe
naturellement sur la grille : une tranche par temps ou par demi-temps, aux
lignes multiples du LPB.

---

### LPB — la décision qui compte

Le LPB fixe la finesse de placement des tranches de break.

| LPB | Lignes / mesure | Placement le plus fin | Coût |
|---|---|---|---|
| 4 | 16 | Double-croche | Classique tracker, insuffisant pour l'edit fin |
| 8 | 32 | Triple-croche | Compromis |
| 16 | 64 | Quadruple-croche | Lecture des blocs plus lourde, plus d'événements/s |

Deux résolutions distinctes se combinent, ne pas les confondre :

- **LPB** = résolution du *quand* — à quel instant la tranche est déclenchée.
- **Commande d'offset** = résolution du *quoi* — quel point du sample est lu.

Un LPB trop grossier rend certains edits impossibles quelle que soit la
précision de l'offset. L'inverse est vrai aussi.

**Contrainte machine :** plus de lignes par seconde = plus d'événements traités
par le 68000. Sur A600 sans fast RAM, ce n'est pas gratuit. *À mesurer plutôt
qu'à supposer* : écrire un bloc dense au LPB visé et écouter s'il tient.

### Longueur de bloc

**Un nombre entier de mesures, non négociable.** Le RE-303 boucle des motifs
d'une mesure ; un bloc qui ne tombe pas juste désaligne la structure musicale
même avec un clock parfait.

Le choix se fait entre lisibilité (blocs courts, séquence longue) et confort
d'écriture (blocs longs, moins de sauts). Le §11.2 impose que les deux machines
aient **le même nombre de blocs, de même longueur** — un bloc vide plutôt qu'un
bloc court là où une machine ne joue rien.

---

## 2.2 Réglage dérivé : SPC

Une fois le LPB fixé, poser `SPC = LPB` dans le menu Edit : une frappe avance
d'un temps exactement. La bascule `` ` `` ramène au pas de 1 pour l'edit fin.

Ce réglage est à refaire si le LPB change — c'est une des raisons de ne pas
changer le LPB.

---

## 2.3 Produit : `TEMPLATE_MASTER.med`

Contenu :

- **8 pistes**, éditables même si l'A600 ne peut pas les jouer
- Grille figée : BPM, LPB, longueur de bloc
- Blocs vides
- Instruments **1–30 réservés A1200**, **33–62 réservés A600**, non peuplés
- SPC posé

Tout morceau part de ce fichier. Il va dans `ressources/templates/` et il est
versionné : le jour où il bouge, l'historique doit le dire.

**Sans undo :** dupliquer avant toute manipulation. Le template est un original.

---

## Critère de sortie

Les trois valeurs inscrites au §12.3 de `ETAT.md`, template créé et copié dans
le dépôt. Commit : `FORM-02: grille figée BPM/LPB/longueur`.

---

## Réserve

Ces valeurs sont figées **sous réserve du §8.1**. Si l'arbitrage bascule vers le
RE-303 maître, la structure devient bouclée plutôt que linéaire écrite, et le
§11.2 est à réécrire — le BPM et le LPB survivent, la convention de longueur de
bloc et de séquence identique, non.
