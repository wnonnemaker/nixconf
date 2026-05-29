#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $(basename "$0") <name>" >&2
  exit 1
fi

NAME="$1"
AUDIO_FILE="${NAME}.wav"
TEXT_FILE="${NAME}.txt"

EXISTING_CONTENT=""
[[ -f "${TEXT_FILE}" ]] && EXISTING_CONTENT=$(cat "${TEXT_FILE}")

echo "Recording to ${AUDIO_FILE} (Ctrl+C to stop, 10-minute max)..."
arecord -f cd -t wav -d 600 "${AUDIO_FILE}" || true

echo "Transcribing..."
whisper "${AUDIO_FILE}" --model turbo --output_format txt --language en

rm "${AUDIO_FILE}"

sed -i 's/[Nn]ew [Pp]aragraph/\n/g' "${TEXT_FILE}"

if [[ -n "${EXISTING_CONTENT}" ]]; then
  printf '%s\n%s' "${EXISTING_CONTENT}" "$(cat "${TEXT_FILE}")" > "${TEXT_FILE}"
  echo "Transcription appended to ${TEXT_FILE}"
else
  echo "Transcription saved to ${TEXT_FILE}"
fi
