#!/bin/bash
#replace zone as needed
ZONE="europe-west3-a"
SID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | tr '[:upper:]' '[:lower:]'| head -n 1)
INSTANCE="zep-${SID}"

gcloud compute instances create ${INSTANCE} --zone ${ZONE} --machine-type g1-small --maintenance-policy "MIG
RATE" --image "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lt
s" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "${INSTANCE}disk"
