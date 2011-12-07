Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f181.google.com (mail-ey0-f181.google.com
	[209.85.215.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC07AE0030C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2011 06:42:22 -0800 (PST)
Received: by eaal13 with SMTP id l13so631963eaa.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Dec 2011 06:42:22 -0800 (PST)
Received: by 10.213.25.82 with SMTP id y18mr579517ebb.94.1323268941949;
	Wed, 07 Dec 2011 06:42:21 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id v3sm6286463eej.7.2011.12.07.06.42.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 06:42:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed,  7 Dec 2011 15:42:13 +0100
Message-Id: <1323268934-11949-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
References: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 2/3] u-boot: cleanup
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
X-List-Received-Date: Wed, 07 Dec 2011 14:42:23 -0000

Set compatible machine in all recipes, remove deprecated versions for some machines

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-bsp/u-boot/u-boot-sakoman_git.bb |    2 ++
 recipes-bsp/u-boot/u-boot_2011.10rc.bb   |    2 ++
 recipes-bsp/u-boot/u-boot_git.bb         |   25 +------------------------
 3 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-sakoman_git.bb b/recipes-bsp/u-boot/u-boot-sakoman_git.bb
index 5b9ff11..fab269a 100644
--- a/recipes-bsp/u-boot/u-boot-sakoman_git.bb
+++ b/recipes-bsp/u-boot/u-boot-sakoman_git.bb
@@ -1,5 +1,7 @@
 require u-boot.inc
 
+COMPATIBLE_MACHINE = "omap4430-panda"
+
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-sakoman-git/"
 
 SRCREV = "261733408a27d14590cf3ec6b596461808050e32"
diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index ebcb353..74597f6 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -2,7 +2,9 @@ require u-boot.inc
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(ti33x)"
+
 DEFAULT_PREFERENCE_ti33x = "99"
+
 PV = "2011.09+git"
 PR = "r25"
 
diff --git a/recipes-bsp/u-boot/u-boot_git.bb b/recipes-bsp/u-boot/u-boot_git.bb
index 022d7fc..5abb6f5 100644
--- a/recipes-bsp/u-boot/u-boot_git.bb
+++ b/recipes-bsp/u-boot/u-boot_git.bb
@@ -1,35 +1,12 @@
 require u-boot.inc
 PR ="r67"
 
+DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_ti814x = "-1"
 DEFAULT_PREFERENCE_ti816x = "-1"
 
 FILESPATHPKG =. "u-boot-git:"
 
-SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
-                       file://0001-OMAP3-Beagle-Pin-Mux-initialization-glitch-fix.patch \
-                       file://0002-OMAP-Remove-omapfb.debug-y-from-Beagle-and-Overo-env.patch \
-                       file://0003-omap3_beagle-enable-the-use-of-a-plain-text-file-nam.patch \
-                       file://0004-OMAP3-BeagleBoard-Enable-pullups-on-i2c2.patch \
-                       file://0005-ARMV7-OMAP3-BeagleBoard-add-xM-rev-B-to-ID-table.patch \
-                       file://0006-OMAP3-BeagleBoard-add-more-expansionboard-IDs.patch \
-                       file://0007-OMAP3-Add-DSS-driver-for-OMAP3.patch \
-                       file://0008-BeagleBoard-Added-userbutton-command.patch \
-                       file://0009-OMAP3-beagle-pass-expansionboard-name-in-bootargs.patch \
-                       file://0010-Enable-DSS-driver-for-Beagle.patch \
-                       file://0011-Add-led-command.patch \
-                       file://0012-BeagleBoard-Added-LED-driver.patch \
-                       file://0013-OMAP3-BeagleBoard-updated-default-configuration.patch \
-                       file://0014-Corrected-LED-name-match-finding-avoiding-extraneous.patch \
-                       file://0015-omap3_beagle-Switch-default-console-from-ttyS2-to-tt.patch \
-                       file://0016-BeagleBoard-Load-kernel-via-MMC-ext2-not-fat.patch \
-                       file://fw_env.config \
-                      "
-
-SRCREV_pn-${PN}_beagleboard = "c7977858dcf1f656cbe91ea0dc3cb9139c6a8cc8"
-PV_pn-${PN}_beagleboard = "2011.02+${PR}+gitr${SRCREV}"
-LIC_FILES_CHKSUM_pn-${PN}_beagleboard = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
 # ~ TI PSP v2009.11_OMAPPSP_03.00.01.06 (+ couple of commits)
 SRC_URI_omap3evm = "git://arago-project.org/git/projects/u-boot-omap3.git;protocol=git \
     file://0001-omap3evm-Change-default-console-serial-port-from.patch \
-- 
1.7.2.5


