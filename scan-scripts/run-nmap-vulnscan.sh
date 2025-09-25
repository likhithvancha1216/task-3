#!/usr/bin/env bash
# run-nmap-vulnscan.sh
# Usage: ./run-nmap-vulnscan.sh <target-ip>
# Example: ./run-nmap-vulnscan.sh 127.0.0.1

set -euo pipefail

TARGET="${1:-127.0.0.1}"
OUTDIR="../reports"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
OUTFILE="${OUTDIR}/nmap_vuln_scan_${TARGET}_${TIMESTAMP}.txt"
OUTXML="${OUTDIR}/nmap_vuln_scan_${TARGET}_${TIMESTAMP}.xml"

mkdir -p "${OUTDIR}"

echo "Running nmap vulnerability scan on ${TARGET}"
echo "Results will be saved in:"
echo "  - ${OUTFILE}"
echo "  - ${OUTXML}"
echo ""

# Ensure nmap is installed
if ! command -v nmap >/dev/null 2>&1; then
  echo "Error: nmap is not installed. Install nmap and try again." >&2
  exit 1
fi

# Run nmap with SYN scan, version detection, OS detection and vulners script (min CVSS 5.0)
nmap -sS -sV -O --script=vulners --script-args mincvss=5.0 \
  -oN "${OUTFILE}" -oX "${OUTXML}" "${TARGET}"

echo ""
echo "Scan complete."
echo "Human-readable output: ${OUTFILE}"
echo "XML output: ${OUTXML}"
