##########################################################################################
#
# MMT Extended Config Script
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Uncomment and change 'MINAPI' and 'MAXAPI' to the minimum and maximum android version for your mod
# Uncomment DYNLIB if you want libs installed to vendor for oreo+ and system for anything older
# Uncomment DEBUG if you want full debug logs (saved to /sdcard)
MINAPI=23
MAXAPI=33
#DYNLIB=true
#DEBUG=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

##########################################################################################
# Permissions
##########################################################################################
##########################################################################################
# Permissions
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644
  set_perm  $MODPATH/system/app/messaging/messaging.apk       0       0       0644
  set_perm  $MODPATH/system/etc/permissions/com.google.android.dialer.support.xml        0        0        0644
  set_perm  $MODPATH/system/framework/com.google.android.dialer.support.jar        0        0        0644
  set_perm  $MODPATH/system/priv-app/contacts/contacts.apk        0       0       0644
  set_perm  $MODPATH/system/priv-app/Dialer/Dialer.apk        0        0        0644
  set_perm  $MODPATH/system/priv-app/CallRecorder/CallRecorder.apk        0        0        0644
  # Only some special files require specific permissions
set_perm_recursive $MODPATH 0 0 0755 0644
  # The default permissions should be good enough for most cases

  # Some templates if you have no idea wha
  # set_perm $MODPATH/system/lib/libart.so 0 0 0644
  # set_perm /data/local/tmp/file.txt 0 0 644
}

##########################################################################################
# MMT Extended Logic - Don't modify anything after this
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
