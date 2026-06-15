#!/usr/bin/env bash
# Generate the skill icon strips from ICONS.md.
# For each category section in ICONS.md, the checked (- [x]) icons are fetched from
# skillicons.dev and saved to assets/skills-<category>-{dark,light}.svg (self-hosted,
# so GitHub's image proxy cannot cache a broken response).
#
# To customize: open ICONS.md, check/uncheck icons, then run `bash scripts/fetch-skills.sh`.
set -e
cd "$(dirname "$0")/.."

# "ICONS.md heading | output file key"  (key must match the README references)
SECTIONS=(
  "Languages|languages"
  "Frameworks & Libraries|frameworks"
  "Tools|tools"
)

# Print the checked icon names under a given "## <heading>" section of ICONS.md.
extract() {
  awk -v h="## $1" '
    $0 == h { inq = 1; next }
    /^## / { inq = 0 }
    inq && /^- \[[xX]\] \*\*/ {
      s = $0
      sub(/^- \[[xX]\] \*\*/, "", s)   # strip the checkbox + opening **
      sub(/\*\*.*/, "", s)             # strip the closing ** and any description
      print s
    }
  ' ICONS.md
}

mkdir -p assets
any=0
for sec in "${SECTIONS[@]}"; do
  heading="${sec%%|*}"; key="${sec##*|}"
  icons=$(extract "$heading" | paste -sd, -)
  if [ -z "$icons" ]; then
    echo "skip $key (no icons checked under '## $heading')"
    continue
  fi
  any=1
  echo "$key: $icons"
  for theme in dark light; do
    curl -s "https://skillicons.dev/icons?i=$icons&theme=$theme" -o "assets/skills-$key-$theme.svg"
  done
done
[ "$any" = 1 ] && echo "Done. Edit ICONS.md and re-run to change your skills." || echo "Nothing checked in ICONS.md."
