# FORM-01 — Navigation et saisie

**Machine :** A600 seule. **Prérequis :** écran + écoute. **Coût :** 0 €.
**Durée :** 2 séances d'1 h. **Produit :** `ressources/fiches/raccourcis-octamed.md`.

Indépendant de FORM-00 — peut tourner en parallèle des relevés.

---

## 1.0 Prérequis matériel de l'exercice

Il faut **deux samples chargés** : un kick, un hat. Sans instrument, rien à saisir.

Deux voies, la première d'abord :

1. Charger un mod déjà présent sur la CF et récupérer ses instruments.
2. Sinon, transfert depuis le portable via CF (machine éteinte, FAT16, `fat95`).

Peu importe la qualité des samples : c'est un exercice de gestes, pas d'écoute.
Note leurs numéros d'instrument, ils serviront dans tous les exercices.

---

## 1.1 Pourquoi cette étape n'est pas une fiche à recopier

Les raccourcis diffèrent entre MED 3.x, OctaMED Pro V4 et SoundStudio. Une fiche
donnée de mémoire serait fausse par endroits, et une fiche fausse coûte plus
cher que pas de fiche — tu perdrais du temps à te battre contre elle.

Donc : **tu relèves, je structure.** Ce qui suit est la liste de ce qu'il faut
trouver, dans l'ordre d'utilité pour ton matériau. C'est ça, la valeur — savoir
quoi chercher et dans quel ordre.

**Méthode de relevé :** parcourir les menus au bouton droit. Les applications
Amiga affichent l'équivalent clavier en regard de chaque entrée de menu. Ce qui
n'apparaît nulle part se teste, et se note comme *testé*, pas comme *lu*.

---

## 1.2 Grille à relever

Ordre = fréquence d'usage réelle. Les familles A, B et C suffisent à écrire ;
D et E font la différence en vitesse.

### A — Déplacement

| Fonction | Raccourci |
|---|---|
| Curseur ligne ↑ / ↓ | |
| Saut de plusieurs lignes | |
| Début / fin de bloc | |
| Piste précédente / suivante | |
| Champ suivant dans une piste (note / instrument / commande / paramètre) | |
| Bloc précédent / suivant | |

### B — Saisie

| Fonction | Raccourci |
|---|---|
| Disposition du clavier de notes (les deux rangées) | |
| Octave courante : affichage + changement | |
| Instrument courant : affichage + changement | |
| Effacer la note sous le curseur | |
| Effacer une ligne entière (tous champs) | |
| Note-off / key-off : existe ? symbole ? | |
| Pas d'avance après saisie (edit step) : réglable ? | |

### C — Lecture

| Fonction | Raccourci |
|---|---|
| **Mode édition ON / OFF** | |
| Jouer le bloc | |
| Jouer depuis la ligne courante | |
| Jouer le morceau | |
| Stop | |
| Bouclage du bloc en lecture | |

Le mode édition est le premier à identifier : tant que tu ne sais pas où il est,
tu écris des notes en essayant d'en jouer, ou l'inverse.

### D — Édition de plage

| Fonction | Raccourci |
|---|---|
| Marquer une plage | |
| Copier / couper / coller | |
| **Undo : existe ? profondeur ?** | |
| Transposer une plage | |

L'undo change la façon de travailler : avec, on essaie ; sans, on duplique le
bloc avant chaque expérience. À savoir tôt.

### E — Réglages de bloc

| Fonction | Où |
|---|---|
| Longueur du bloc | |
| Tempo | |
| LPB (lignes par temps) | |
| Nombre de pistes | |

**Localiser uniquement, ne rien changer.** Ces valeurs se décident en FORM-02.
Une valeur choisie à la légère maintenant deviendrait un ancrage.

---

## 1.3 Exercices

Fichier de travail : `EX01.med`, dans un dossier scratch. Il ne rejoint pas le
dépôt, ce n'est pas un artefact.

| # | Exercice | Objectif |
|---|---|---|
| 1 | Kick sur les 4 temps, bloc de 16 lignes, piste 1 | Saisie brute, souris tolérée |
| 2 | Hat sur les contretemps, piste 2 | Changement de piste et d'instrument |
| 3 | Bloc vidé, tout refaire | Première mesure au chrono |
| 4 | Décaler le hat d'une ligne, effacer une note sur deux | Édition, pas seulement saisie |
| 5 | Refaire depuis un bloc vide, **au chrono, sans souris** | Critère |

À l'exercice 4, si tu retouches note par note au lieu de marquer une plage :
la famille D n'est pas acquise. Retour au relevé.

---

## Critère de sortie

Bloc kick + hat 16 lignes, saisi et rejoué :

- en **moins de 3 minutes**
- **deux fois d'affilée**
- **sans manuel ouvert**
- **sans souris** pour la saisie et la navigation

Les quatre conditions, pas trois. La souris est le point qui trompe le plus :
elle donne l'impression que c'est acquis alors que le geste n'est pas automatisé.

Fiche complétée → `ressources/fiches/raccourcis-octamed.md`.
Commit : `FORM-01: raccourcis relevés, critère atteint` (ou `raté`, et pourquoi).

---

## Pièges

- **Ne pas toucher tempo, LPB, longueur de bloc.** FORM-02.
- **Ne pas commencer à composer.** Un motif qui sonne bien pendant cet exercice
  est une étude, pas du matériau — §12.6.
- Si un raccourci est trouvé par tâtonnement et non dans un menu, le noter comme
  *testé* : à re-vérifier sur l'A1200 si les versions diffèrent.
