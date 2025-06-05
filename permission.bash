#!/bin/bash

TCC_DB="$HOME/Library/Application Support/com.apple.TCC/TCC.db"

# Function to get bundle ID
get_bundle_id() {
    osascript -e "id of app \"$1\"" 2>/dev/null
}

# Function to insert TCC entry
insert_permission() {
    local service=$1
    local bundle_id=$2
    echo "Granting $service to $bundle_id..."

    sudo sqlite3 "$TCC_DB" <<EOF
INSERT OR REPLACE INTO access (
  service, client, client_type, auth_value, auth_reason, auth_version,
  csreq, policy_id, indirect_object_identifier_type, indirect_object_identifier,
  indirect_object_code_identity, flags, last_modified, pid, pid_version,
  boot_uuid, last_reminded
)
VALUES (
  '$service', '$bundle_id', 0, 2, 4, 1,
  NULL, NULL, 0, 'UNUSED',
  NULL, 0, strftime('%s','now'), 0, 0,
  'UNUSED', strftime('%s','now')
);
EOF
}

# Ask for app name
read -p "Enter the application name (as shown in Finder): " APP_NAME

# Get bundle ID
BUNDLE_ID=$(get_bundle_id "$APP_NAME")

if [ -z "$BUNDLE_ID" ]; then
    echo "❌ Could not find bundle ID for '$APP_NAME'. Is the app name correct?"
    exit 1
fi

echo "✅ Found bundle ID: $BUNDLE_ID"

# Ask which permissions to grant
echo "Which permissions would you like to grant to $APP_NAME?"
echo "1) Microphone"
echo "2) Screen Recording"
echo "3) Camera"
echo "4) Accessibility"
echo "5) All of the above"
read -p "Enter your choices (e.g. 1 2): " CHOICES

# Grant selected permissions
for choice in $CHOICES; do
    case $choice in
        1) insert_permission "kTCCServiceMicrophone" "$BUNDLE_ID" ;;
        2) insert_permission "kTCCServiceScreenCapture" "$BUNDLE_ID" ;;
        3) insert_permission "kTCCServiceCamera" "$BUNDLE_ID" ;;
        4) insert_permission "kTCCServiceAccessibility" "$BUNDLE_ID" ;;
        5)
            insert_permission "kTCCServiceMicrophone" "$BUNDLE_ID"
            insert_permission "kTCCServiceScreenCapture" "$BUNDLE_ID"
            insert_permission "kTCCServiceCamera" "$BUNDLE_ID"
            insert_permission "kTCCServiceAccessibility" "$BUNDLE_ID"
            break
            ;;
        *) echo "❌ Invalid choice: $choice" ;;
    esac
done

echo "✅ Done. Now go to System Preferences > Security & Privacy and toggle permissions if needed."
