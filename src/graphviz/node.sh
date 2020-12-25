#!/bin/sh
DIR_ICONS=/var/cache/aws-png-icons
DIR_TEMPLATES=/etc/aws-cloudformation-graphviz/templates

if [ -z "$id" ]; then
  echo "Missing resource id."
  exit 1
fi
if [ -z "$type" ]; then
  echo "Missing resource type."
  exit 1
fi

friendly() {
  sed 's/Custom::EventBridge/AWS::Events::EventBus/'
}

main() {
  local friendlyType=`echo "$type" | friendly`
  local searchTerm=`echo "$type" | parse`
  local imageFile=`search "$searchTerm"`
  cat "$DIR_TEMPLATES/node.gv" | friendlyType="$friendlyType" imageFile="$imageFile" envsubst
}

# TODO Allow customisable overrides (i.e. where AWS's filenames are named weirdly)
parse() {
  sed 's/^AWS::\(.*\)::.*$/\1/' \
    | sed 's/Custom::EventBridge/EventBridge/' \
    | sed 's/IAM/Identity-and-Access-Management_IAM/' \
    | sed 's/Logs/CloudWatch/' \
    | sed 's/S3/Simple-Storage-Service/'
}

search() {
  (ls "$DIR_ICONS"/*.png | grep -i "$1" \
    || ls "$DIR_ICONS"/General*.png | grep -v "Access-Points") \
    | head -n 1
}

main
