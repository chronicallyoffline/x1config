#!/bin/bash

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y exfat-utils fuse-exfat

sudo dnf copr enable dawid/better_fonts

sudo dnf copr enable zawertun/kde

sudo dnf update --refresh -y

sudo dnf install -y fontconfig-enhanced-defaults fontconfig-font-replacements libva libva-utils ffmpeg intel-media-driver alsa-tools patch 

echo > HiFi.conf.dist <<EOF

--- /usr/share/alsa/ucm2/sof-hda-dsp/HiFi.conf.dist
+++ /usr/share/alsa/ucm2/sof-hda-dsp/HiFi.conf
@@ -20,9 +20,9 @@ SectionDevice."Headphones1" {
 	Value {
 		PlaybackPriority 200
 		PlaybackPCM "hw:${CardId}"
-		PlaybackMixerElem "Headphone"
+		PlaybackMixerElem "Master"
 		PlaybackMasterElem "Master"
-		PlaybackVolume "Headphone Playback Volume"
+		PlaybackVolume "Master Playback Volume"
 		PlaybackSwitch "Headphone Playback Switch"
 		If.jack {
 			Condition {
@@ -72,9 +72,9 @@ SectionDevice."Speaker" {
 	Value {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId}"
-		PlaybackMixerElem "Speaker"
+		PlaybackMixerElem "Master"
 		PlaybackMasterElem "Master"
-		PlaybackVolume "Speaker Playback Volume"
+		PlaybackVolume "Master Playback Volume"
 		PlaybackSwitch "Speaker Playback Switch"
 	}
 }

EOF

sudo cp HiFi.conf.dist /usr/share/alsa/ucm2/sof-hda-dsp/HiFi.conf.dist 

cd /usr/share/alsa/ucm2/sof-hda-dsp/

pwd

sudo patch < HiFi.conf.dist

sudo echo > /etc/systemd/system/hda-fix.service <<EOF

[Unit]
Description=Bass Sound Fix For Lenovo X1 7th gen
After=multi-user.target suspend.target hibernate.target hybrid-sleep.target

[Service]
Type=oneshot
ExecStart=/usr/bin/hda-verb /dev/snd/hwC0D0 0x17 SET_CONNECT_SEL 1

[Install]
WantedBy=multi-user.target suspend.target hibernate.target hybrid-sleep.target

EOF

sudo systemctl enable hda-fix.service

