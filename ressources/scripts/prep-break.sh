#!/bin/bash
# prep-break.sh — prépare un break pour OctaMED Pro 4.03 / Paula
#
# Usage : ./prep-break.sh source.wav AMEN
#         (le préfixe de sortie fait 6 caractères max, contrainte 8.3 / FAT16)
#
# Produit trois taux d'échantillonnage pour comparer coût chip et rendu.
# Ne décide rien : c'est le TP FORM-02 qui tranche.
#
# Prérequis : sox

set -euo pipefail

SRC="${1:?usage: prep-break.sh source.wav PREFIXE}"
PFX="${2:?usage: prep-break.sh source.wav PREFIXE}"
OUT="./out"

mkdir -p "$OUT"

# -c 1                mono, obligatoire (Paula ne lit pas de stéréo entrelacé)
# -b 8                8 bits
# -e signed-integer   SIGNÉ — le non-signé donne distorsion + offset continu
# -D                  pas de dither : sur 8 bits il ajoute un souffle audible
# gain -n -1          normalisation à -1 dBFS avant réduction de résolution
for RATE in 11025 16726 22050; do
  TAG=$(( RATE / 1000 ))
  DST="$OUT/${PFX}${TAG}.IFF"
  sox "$SRC" -c 1 -b 8 -e signed-integer -D -r "$RATE" "$DST" gain -n -1
  SIZE=$(stat -f%z "$DST" 2>/dev/null || stat -c%s "$DST")
  printf '%-16s %7d Hz  %8d o  %6.1f Ko\n' \
    "$(basename "$DST")" "$RATE" "$SIZE" "$(echo "$SIZE/1024" | bc -l)"
done

cat <<'EOF'

À reporter dans ETAT.md §12.3 une fois le TP fait :
  - taux retenu
  - taille en octets (= coût chip exact)
  - note de référence qui rejoue le break à sa vitesse d'origine

Rappel plafond Paula : ~28,8 kHz en PAL. Un break stocké à 22 kHz ne peut être
monté que d'environ un ton avant de buter. Stocker plus bas = plus de marge de
transposition vers le haut, moins de définition.
EOF
