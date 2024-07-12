osascript -e 'id of app "Microsoft Teams"'
com.microsoft.teams2

osascript -e 'id of app "Skype"'
com.skype.skype

osascript -e 'id of app "Slack"'
com.tinyspeck.slackmacgap

osascript -e 'id of app "zoom.us"'
us.zoom.xos

osascript -e 'id of app "WhatsApp"'
net.whatsapp.WhatsApp


INSERT OR REPLACE INTO access (
    service, client, client_type, auth_value, auth_reason, auth_version, csreq, policy_id, indirect_object_identifier_type, indirect_object_identifier, indirect_object_code_identity, flags, last_modified, pid, pid_version, boot_uuid, last_reminded
) VALUES
('kTCCServiceMicrophone', 'com.skype.skype', 0, 1, 1, 1, NULL, NULL, NULL, 'UNUSED', NULL, 0, CAST(strftime('%s','now') AS INTEGER), NULL, NULL, 'UNUSED', CAST(strftime('%s','now') AS INTEGER)),
('kTCCServiceScreenCapture', 'com.skype.skype', 0, 1, 1, 1, NULL, NULL, NULL, 'UNUSED', NULL, 0, CAST(strftime('%s','now') AS INTEGER), NULL, NULL, 'UNUSED', CAST(strftime('%s','now') AS INTEGER)),
('kTCCServiceMicrophone', 'us.zoom.xos', 0, 1, 1, 1, NULL, NULL, NULL, 'UNUSED', NULL, 0, CAST(strftime('%s','now') AS INTEGER), NULL, NULL, 'UNUSED', CAST(strftime('%s','now') AS INTEGER)),
('kTCCServiceScreenCapture', 'us.zoom.xos', 0, 1, 1, 1, NULL, NULL, NULL, 'UNUSED', NULL, 0, CAST(strftime('%s','now') AS INTEGER), NULL, NULL, 'UNUSED', CAST(strftime('%s','now') AS INTEGER));

