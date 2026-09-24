#!/bin/bash
# Lunaris vendorsetup for Xiaomi Pad 7 (uke) - prebuilt kernel, no patches
# Updated: 2026-09-24 — future-proof signing keys (evolution-priv) included
ROOT_DIR=$(pwd)
clone_if_missing() {
    local url=$1 branch=$2 dir=$3
    if [ ! -d "$dir" ]; then
        echo "-> Cloning $dir..."
        git clone --depth 1 "$url" -b "$branch" "$dir" -q \
            && echo "Cloned $dir." || { echo "Failed: $url" >&2; return 1; }
    else
        echo "-> $dir exists, skipping."
    fi
}
clone_if_missing "https://github.com/delano-git/android_device_xiaomi_uke"              "lineage-23.2" "device/xiaomi/uke"
clone_if_missing "https://github.com/delano-git/android_device_xiaomi_sm8635-common"     "lineage-23.2" "device/xiaomi/sm8635-common"
clone_if_missing "https://github.com/delano-git/android_device_xiaomi_uke-kernel"         "lineage-23.2" "device/xiaomi/uke-kernel"
clone_if_missing "https://github.com/delano-git/android_vendor_xiaomi_uke"               "lineage-23.2" "vendor/xiaomi/uke"
clone_if_missing "https://github.com/delano-git/android_vendor_xiaomi_sm8635-common"     "lineage-23.2" "vendor/xiaomi/sm8635-common"
clone_if_missing "https://github.com/LineageOS/android_hardware_xiaomi"                  "lineage-23.2" "hardware/xiaomi"
clone_if_missing "https://github.com/AxionAOSP-devices/packages_apps_LunarisDolby"        "16.0"      "packages/apps/LunarisDolby"
clone_if_missing "https://github.com/kuroringo90/vendor_evolution-priv_keys-template.git" "master"     "vendor/evolution-priv/keys"
echo "Setup complete!"
