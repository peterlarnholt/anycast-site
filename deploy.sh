#!/bin/bash
set -e

PROJECT="anycast-492013"
ZONE="us-central1-a"
VM="loket"
DEST="/opt/anycast/web/welcome"

DIR="$(cd "$(dirname "$0")" && pwd)"

echo "→ Deploying marketing site to $VM:$DEST ..."

gcloud compute ssh "$VM" --project="$PROJECT" --zone="$ZONE" \
    --command "rm -rf /tmp/anycast-welcome && mkdir -p /tmp/anycast-welcome"

gcloud compute scp --project="$PROJECT" --zone="$ZONE" \
    "$DIR"/*.html "$VM:/tmp/anycast-welcome/"

gcloud compute ssh "$VM" --project="$PROJECT" --zone="$ZONE" \
    --command "sudo mkdir -p $DEST && sudo cp /tmp/anycast-welcome/*.html $DEST/ && rm -rf /tmp/anycast-welcome"

echo "  ✓ Marketing deployed to https://anycast.excom.ai/welcome/"
