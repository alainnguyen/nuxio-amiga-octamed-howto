#!/usr/bin/env bash
#
# prep-break.sh — prepare un break pour OctaMED (Amiga PAL)
#
# Usage : ./prep-break.sh <source.wav> [mesures] [BPM]
# Exemple : ./prep-break.sh amen_src.wav 4 170
#
# Produit 3 fichiers IFF 8SVX, 8 bits signes, mono, nommage 8.3,
# de longueur exacte pour boucler sur un bloc de <mesures> a <BPM>.
#
# Les 3 taux ne sont PAS ronds : ce sont les frequences exactes de
# 3 notes Paula en PAL. Un taux rond ne tombe sur aucune note et
# produit une couture de ~0,76 % a la boucle.
#
set -euo pipefail

# ---------------------------------------------------------------
# Constantes
# ---------------------------------------------------------------

CLOCK_PAL=3546895        # horloge Paula PAL, en Hz

# taux = CLOCK_PAL / periode
#   A et C sont en rapport 2:1 EXACT -> substituables entre eux
#   par transposition de +/- 12 demi-tons, sans changer la longueur
#   de boucle. Voir §11.6.
#   B n'est a un intervalle exact d'aucun des deux (~5 cents d'ecart) :
#   ECOUTE COMPARATIVE SEULEMENT, ne pas l'utiliser pour substituer.
RATE_A=11084             # periode 320
RATE_B=16574             # periode 214
RATE_C=22168             # periode 160

# ---------------------------------------------------------------
# Arguments
# ---------------------------------------------------------------

SRC="${1:-}"
N="${2:-4}"              # mesures que couvre le break source
BPM="${3:-170}"          # tempo cible du bloc

if [ -z "$SRC" ]; then
    echo "usage: $0 <source.wav> [mesures] [BPM]" >&2
    exit 1
fi

for tool in sox soxi bc; do
    command -v "$tool" >/dev/null || { echo "manquant : $tool" >&2; exit 1; }
done

[ -f "$SRC" ] || { echo "introuvable : $SRC" >&2; exit 1; }

# le nommage 8.3 casse au-dela de 3 chiffres de BPM
if [ "${#BPM}" -gt 3 ]; then
    echo "BPM a plus de 3 chiffres : nommage 8.3 impossible" >&2
    exit 1
fi

# ---------------------------------------------------------------
# Mesure de la source
# ---------------------------------------------------------------

L0=$(soxi -s "$SRC")                                    # echantillons
R0=$(soxi -r "$SRC")                                    # Hz

D0=$(echo "scale=10; $L0 / $R0"       | bc -l)          # duree source, s
D=$(echo  "scale=10; $N * 240 / $BPM" | bc -l)          # duree cible,  s
K=$(echo  "scale=10; $D0 / $D"        | bc -l)          # facteur vitesse

BPM_NAT=$(echo "scale=2; 240 * $N / $D0" | bc -l)       # tempo natif du break

echo
echo "  source        : $SRC"
echo "  ${L0} ech. a ${R0} Hz  =  $(printf '%.3f' "$D0") s"
echo "  mesures       : $N   ->  BPM natif du break : $BPM_NAT"
echo "  cible         : $BPM BPM  =  $(printf '%.3f' "$D") s"
echo "  facteur k     : $(printf '%.5f' "$K")   (>1 = acceleration)"
echo

# garde-fou : au-dela de +/- 35 %, la transposition denature le break
ALERTE=$(echo "$K > 1.35 || $K < 0.75" | bc -l)
if [ "$ALERTE" -eq 1 ]; then
    echo "  /!\\  ecart au natif > 35 % : le break va sonner deforme."
    echo "       verifier le nombre de mesures ($N) avant d'aller plus loin."
    echo
fi

# ---------------------------------------------------------------
# Rendu
# ---------------------------------------------------------------

printf "  %-14s %-8s %-10s %-8s %s\n" FICHIER TAUX ECHANT. CHIP VERIF
printf "  %s\n" "----------------------------------------------------------"

for PAIR in "A $RATE_A" "B $RATE_B" "C $RATE_C"; do
    TAG=${PAIR%% *}
    R=${PAIR##* }

    # longueur exacte en echantillons, tronquee a l'entier
    L=$(echo "$D * $R" | bc -l | cut -d. -f1)

    OUT="AMEN${BPM}${TAG}.IFF"

    # -D            : pas de dither (grain 8 bits assume, previsible)
    # speed / rate  : accelere puis reechantillonne au taux Paula
    # pad 0 0.05    : filet de securite si le rendu tombe court
    # trim 0 Ls     : coupe a la longueur exacte -- indispensable,
    #                 le reechantillonnage arrondit toujours
    sox -D "$SRC" -b 8 -e signed-integer -c 1 -r "$R" -t 8svx "$OUT" \
        speed "$K" \
        rate -v "$R" \
        pad 0 0.05 \
        trim 0 "${L}s"

    LOUT=$(soxi -s "$OUT")
    KO=$(echo "scale=1; $LOUT / 1024" | bc -l)

    if [ "$LOUT" -eq "$L" ]; then VERIF="ok"; else VERIF="ECART ${LOUT}"; fi

    printf "  %-14s %-8s %-10s %-8s %s\n" "$OUT" "$R" "$L" "${KO} Ko" "$VERIF"
done

echo
echo "  Budget chip A600 avec OctaMED charge : 209 Ko contigus."
echo "  A copier sur la carte CF, puis TP 2.1-bis."
echo
