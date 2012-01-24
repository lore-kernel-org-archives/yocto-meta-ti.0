Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D467DE00718
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 03:31:35 -0800 (PST)
Received: by werb10 with SMTP id b10so3339944wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 03:31:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.139.91 with SMTP id b69mr676841wej.51.1327404694463;
	Tue, 24 Jan 2012 03:31:34 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id l6sm6832454wiv.11.2012.01.24.03.31.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 03:31:33 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 24 Jan 2012 12:31:21 +0100
Message-Id: <1327404681-28356-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnC+j6ImY9Xv5tKY34KdLu2U7Qr/V93aIY6qdxoPu0X+rq/uTE7IsHqBQ3la4nhpRS9ZPup
Cc: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH] alsa-state: add beagleboard specific asound.state
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2012 11:31:36 -0000

From: Joshua Lock <josh@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-bsp/alsa-state/alsa-state.bbappend         |    1 +
 .../alsa-state/alsa-state/beagleboard/asound.state |  656 ++++++++++++++++++++
 2 files changed, 657 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/alsa-state/alsa-state.bbappend
 create mode 100644 recipes-bsp/alsa-state/alsa-state/beagleboard/asound.state

diff --git a/recipes-bsp/alsa-state/alsa-state.bbappend b/recipes-bsp/alsa-state/alsa-state.bbappend
new file mode 100644
index 0000000..72d991c
--- /dev/null
+++ b/recipes-bsp/alsa-state/alsa-state.bbappend
@@ -0,0 +1 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/recipes-bsp/alsa-state/alsa-state/beagleboard/asound.state b/recipes-bsp/alsa-state/alsa-state/beagleboard/asound.state
new file mode 100644
index 0000000..f924491
--- /dev/null
+++ b/recipes-bsp/alsa-state/alsa-state/beagleboard/asound.state
@@ -0,0 +1,656 @@
+state.omap3beagle {
+	control.1 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'Option 2 (voice/audio)'
+		comment.item.1 'Option 1 (audio)'
+		iface MIXER
+		name 'Codec Operation Mode'
+		value 'Option 1 (audio)'
+	}
+	control.2 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 63'
+		comment.dbmin -6300
+		comment.dbmax 0
+		iface MIXER
+		name 'DAC1 Digital Fine Playback Volume'
+		value.0 0
+		value.1 0
+	}
+	control.3 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 63'
+		comment.dbmin -6300
+		comment.dbmax 0
+		iface MIXER
+		name 'DAC2 Digital Fine Playback Volume'
+		value.0 50
+		value.1 50
+	}
+	control.4 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 2'
+		comment.dbmin 0
+		comment.dbmax 1200
+		iface MIXER
+		name 'DAC1 Digital Coarse Playback Volume'
+		value.0 0
+		value.1 0
+	}
+	control.5 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 2'
+		comment.dbmin 0
+		comment.dbmax 1200
+		iface MIXER
+		name 'DAC2 Digital Coarse Playback Volume'
+		value.0 2
+		value.1 2
+	}
+	control.6 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 18'
+		comment.dbmin -2400
+		comment.dbmax 1200
+		iface MIXER
+		name 'DAC1 Analog Playback Volume'
+		value.0 0
+		value.1 0
+	}
+	control.7 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 18'
+		comment.dbmin -2400
+		comment.dbmax 1200
+		iface MIXER
+		name 'DAC2 Analog Playback Volume'
+		value.0 15
+		value.1 15
+	}
+	control.8 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'DAC1 Analog Playback Switch'
+		value.0 false
+		value.1 false
+	}
+	control.9 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 2
+		iface MIXER
+		name 'DAC2 Analog Playback Switch'
+		value.0 true
+		value.1 true
+	}
+	control.10 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 49'
+		comment.dbmin -3700
+		comment.dbmax 1200
+		iface MIXER
+		name 'DAC Voice Digital Downlink Volume'
+		value 0
+	}
+	control.11 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 18'
+		comment.dbmin -2400
+		comment.dbmax 1200
+		iface MIXER
+		name 'DAC Voice Analog Downlink Volume'
+		value 18
+	}
+	control.12 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'DAC Voice Analog Downlink Switch'
+		value false
+	}
+	control.13 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 3'
+		comment.dbmin -1200
+		comment.dbmax 600
+		iface MIXER
+		name 'PreDriv Playback Volume'
+		value.0 0
+		value.1 0
+	}
+	control.14 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 3'
+		comment.dbmin -1200
+		comment.dbmax 600
+		iface MIXER
+		name 'Headset Playback Volume'
+		value.0 3
+		value.1 3
+	}
+	control.15 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 3'
+		comment.dbmin -1200
+		comment.dbmax 600
+		iface MIXER
+		name 'Carkit Playback Volume'
+		value.0 0
+		value.1 0
+	}
+	control.16 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 3'
+		comment.dbmin -600
+		comment.dbmax 1200
+		iface MIXER
+		name 'Earpiece Playback Volume'
+		value 0
+	}
+	control.17 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin 0
+		comment.dbmax 3100
+		iface MIXER
+		name 'TX1 Digital Capture Volume'
+		value.0 12
+		value.1 12
+	}
+	control.18 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 31'
+		comment.dbmin 0
+		comment.dbmax 3100
+		iface MIXER
+		name 'TX2 Digital Capture Volume'
+		value.0 0
+		value.1 0
+	}
+	control.19 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 2
+		comment.range '0 - 5'
+		comment.dbmin 0
+		comment.dbmax 3000
+		iface MIXER
+		name 'Analog Capture Volume'
+		value.0 0
+		value.1 0
+	}
+	control.20 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'Voice high priority'
+		comment.item.1 'HiFi high priority'
+		iface MIXER
+		name 'AVADC Clock Priority'
+		value 'Voice high priority'
+	}
+	control.21 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 '27/20/14 ms'
+		comment.item.1 '55/40/27 ms'
+		comment.item.2 '109/81/55 ms'
+		comment.item.3 '218/161/109 ms'
+		comment.item.4 '437/323/218 ms'
+		comment.item.5 '874/645/437 ms'
+		comment.item.6 '1748/1291/874 ms'
+		comment.item.7 '3495/2581/1748 ms'
+		iface MIXER
+		name 'HS ramp delay'
+		value '27/20/14 ms'
+	}
+	control.22 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'Vibra H-bridge direction'
+		comment.item.1 'Audio data MSB'
+		iface MIXER
+		name 'Vibra H-bridge mode'
+		value 'Vibra H-bridge direction'
+	}
+	control.23 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'Positive polarity'
+		comment.item.1 'Negative polarity'
+		iface MIXER
+		name 'Vibra H-bridge direction'
+		value 'Positive polarity'
+	}
+	control.24 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Analog Right Sub Mic Capture Switch'
+		value false
+	}
+	control.25 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Analog Right AUXR Capture Switch'
+		value true
+	}
+	control.26 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Analog Left Main Mic Capture Switch'
+		value false
+	}
+	control.27 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Analog Left Headset Mic Capture Switch'
+		value false
+	}
+	control.28 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Analog Left AUXL Capture Switch'
+		value true
+	}
+	control.29 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Analog Left Carkit Mic Capture Switch'
+		value false
+	}
+	control.30 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 Analog
+		comment.item.1 Digimic1
+		iface MIXER
+		name 'TX2 Capture Route'
+		value Analog
+	}
+	control.31 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 Analog
+		comment.item.1 Digimic0
+		iface MIXER
+		name 'TX1 Capture Route'
+		value Analog
+	}
+	control.32 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 'Local vibrator'
+		comment.item.1 Audio
+		iface MIXER
+		name 'Vibra Route'
+		value 'Local vibrator'
+	}
+	control.33 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 AudioL1
+		comment.item.1 AudioR1
+		comment.item.2 AudioL2
+		comment.item.3 AudioR2
+		iface MIXER
+		name 'Vibra Mux'
+		value AudioL1
+	}
+	control.34 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'HandsfreeR Switch'
+		value false
+	}
+	control.35 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 Voice
+		comment.item.1 AudioR1
+		comment.item.2 AudioR2
+		comment.item.3 AudioL2
+		iface MIXER
+		name 'HandsfreeR Mux'
+		value Voice
+	}
+	control.36 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'HandsfreeL Switch'
+		value false
+	}
+	control.37 {
+		comment.access 'read write'
+		comment.type ENUMERATED
+		comment.count 1
+		comment.item.0 Voice
+		comment.item.1 AudioL1
+		comment.item.2 AudioL2
+		comment.item.3 AudioR2
+		iface MIXER
+		name 'HandsfreeL Mux'
+		value Voice
+	}
+	control.38 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'CarkitR Mixer Voice'
+		value false
+	}
+	control.39 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'CarkitR Mixer AudioR1'
+		value false
+	}
+	control.40 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'CarkitR Mixer AudioR2'
+		value false
+	}
+	control.41 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'CarkitL Mixer Voice'
+		value false
+	}
+	control.42 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'CarkitL Mixer AudioL1'
+		value false
+	}
+	control.43 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'CarkitL Mixer AudioL2'
+		value false
+	}
+	control.44 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'HeadsetR Mixer Voice'
+		value false
+	}
+	control.45 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'HeadsetR Mixer AudioR1'
+		value false
+	}
+	control.46 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'HeadsetR Mixer AudioR2'
+		value true
+	}
+	control.47 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'HeadsetL Mixer Voice'
+		value false
+	}
+	control.48 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'HeadsetL Mixer AudioL1'
+		value false
+	}
+	control.49 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'HeadsetL Mixer AudioL2'
+		value true
+	}
+	control.50 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PredriveR Mixer Voice'
+		value false
+	}
+	control.51 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PredriveR Mixer AudioR1'
+		value false
+	}
+	control.52 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PredriveR Mixer AudioR2'
+		value false
+	}
+	control.53 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PredriveR Mixer AudioL2'
+		value false
+	}
+	control.54 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PredriveL Mixer Voice'
+		value false
+	}
+	control.55 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PredriveL Mixer AudioL1'
+		value false
+	}
+	control.56 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PredriveL Mixer AudioL2'
+		value false
+	}
+	control.57 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'PredriveL Mixer AudioR2'
+		value false
+	}
+	control.58 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Earpiece Mixer Voice'
+		value false
+	}
+	control.59 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Earpiece Mixer AudioL1'
+		value false
+	}
+	control.60 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Earpiece Mixer AudioL2'
+		value false
+	}
+	control.61 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Earpiece Mixer AudioR1'
+		value false
+	}
+	control.62 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 41'
+		comment.dbmin -5100
+		comment.dbmax -1000
+		iface MIXER
+		name 'Voice Digital Loopback Volume'
+		value 0
+	}
+	control.63 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 7'
+		comment.dbmin -2400
+		comment.dbmax 0
+		iface MIXER
+		name 'Right Digital Loopback Volume'
+		value 0
+	}
+	control.64 {
+		comment.access 'read write'
+		comment.type INTEGER
+		comment.count 1
+		comment.range '0 - 7'
+		comment.dbmin -2400
+		comment.dbmax 0
+		iface MIXER
+		name 'Left Digital Loopback Volume'
+		value 0
+	}
+	control.65 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Voice Analog Loopback Switch'
+		value false
+	}
+	control.66 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left2 Analog Loopback Switch'
+		value false
+	}
+	control.67 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right2 Analog Loopback Switch'
+		value false
+	}
+	control.68 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Left1 Analog Loopback Switch'
+		value false
+	}
+	control.69 {
+		comment.access 'read write'
+		comment.type BOOLEAN
+		comment.count 1
+		iface MIXER
+		name 'Right1 Analog Loopback Switch'
+		value false
+	}
+}
-- 
1.7.2.5


