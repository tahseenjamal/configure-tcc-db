# Grant macOS Privacy Permissions Script

This shell script allows you to grant **macOS privacy permissions** (such as **Microphone**, **Screen Recording**, **Camera**, and **Accessibility**) to any installed application by modifying the `TCC.db` (Transparency, Consent, and Control database).

It is especially useful for **Hackintosh** users or in cases where macOS fails to show the permission prompt for apps like Slack, Zoom, Chrome, etc.

---

## ⚙️ Features

- Prompt for the application name (as shown in Finder)
- Automatically detects the app’s **bundle ID**
- Supports granting:
  - ✅ Microphone access
  - ✅ Screen Recording
  - ✅ Camera access
  - ✅ Accessibility access
- Automatically inserts the appropriate record into the macOS `TCC.db`
- Useful for automating permission fixes in Hackintosh systems

---

## 🔧 Requirements

- macOS (including Hackintosh)
- Command Line Tools
- Root access (uses `sudo`)
- App must be installed and discoverable via `osascript`

---

## 📥 Installation

1. Clone or copy this repo.
2. Save the script as `grant_permissions.sh`.

```bash
chmod +x grant_permissions.sh
```

---

## 🚀 Usage

```bash
./grant_permissions.sh
```

### 🧭 What it does:

1. Prompts:  
   _"Enter the application name (as shown in Finder):"_

2. Detects the app’s bundle ID using AppleScript.

3. Asks which permissions you'd like to grant:
   ```
   1) Microphone
   2) Screen Recording
   3) Camera
   4) Accessibility
   5) All of the above
   ```

4. Inserts the selected permissions into:
   ```
   ~/Library/Application Support/com.apple.TCC/TCC.db
   ```

5. Outputs:
   - Confirmation of bundle ID and permission changes
   - Reminder to toggle permissions in **System Preferences > Security & Privacy**

---

## 📌 Notes

- After running the script, **you may still need to manually toggle** the permissions off and on in:
  ```
  System Preferences > Security & Privacy > Privacy
  ```

- This script directly modifies `TCC.db`, which is **not officially supported by Apple**. Use with caution.

- The app must have been opened at least once before using this script.

---

## 🔐 Permissions Reference

| Service Name              | macOS UI Label       |
|---------------------------|----------------------|
| `kTCCServiceMicrophone`   | Microphone           |
| `kTCCServiceCamera`       | Camera               |
| `kTCCServiceScreenCapture`| Screen Recording     |
| `kTCCServiceAccessibility`| Accessibility        |

---
