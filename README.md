# nuxio-amiga-octamed-howto

Formation OctaMED v4 dans les contraintes du setup live Amiga (A1200 + A600 + RE-303).
Ce n'est pas un cours OctaMED générique : chaque étape sert l'écriture du set.

## Règle de direction — à ne pas enfreindre

**Ce dépôt est la source de vérité. Le projet Claude en reçoit des copies.**

Le sens inverse crée deux versions qui divergent. Après chaque mise à jour de
`ETAT.md`, ré-uploader le fichier dans le projet Claude. Jamais l'inverse.

## Arborescence

```
README.md                    carte du dépôt (ce fichier)
ETAT.md                      §12 — état d'avancement. LE fichier à ré-uploader
steps/
  FORM-00-socle.md           une conversation Claude = un fichier = une étape
  FORM-01-...
ressources/
  brief/                     copie du brief v2 + §11 (référence figée)
  releves/                   mesures : Avail, chronos, niveaux. Versionné
  fiches/                    raccourcis, commandes d'effet. Versionné
  templates/                 TEMPLATE_MASTER.med et dérivés. Versionné
  audio/                     prises TASCAM — IGNORÉ par git, sauvegardé à part
  samples/                   sources brutes — IGNORÉ par git
```

## Conventions

- **Un fichier = une étape = une conversation Claude**, préfixe `FORM-NN`.
  Le préfixe sert à la recherche : `FORM-03` se retrouve, « les samples » non.
- **Commit en fin de séance**, message = `FORM-NN: ce qui a été atteint ou raté`.
  Un échec de critère est un commit comme un autre : l'historique doit le montrer.
- Les `.med` sont versionnés bien que binaires. Git ne les diffe pas, mais
  l'historique d'un template qui se fige a plus de valeur que le diff.
- L'audio n'entre pas dans git. Seules les mesures qu'on en tire.

## Statut

Formation démarrée pendant les deux semaines sans A1200 — voir `ETAT.md`.
Rien de ce qui est écrit ici ne suppose la synchro MIDI acquise (§10 du brief).
