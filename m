Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f181.google.com (mail-ey0-f181.google.com
	[209.85.215.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FAB0E0030C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2011 06:42:21 -0800 (PST)
Received: by eaal13 with SMTP id l13so631929eaa.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Dec 2011 06:42:20 -0800 (PST)
Received: by 10.213.32.202 with SMTP id e10mr604934ebd.133.1323268939956;
	Wed, 07 Dec 2011 06:42:19 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id x12sm6273150eef.9.2011.12.07.06.42.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 06:42:19 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed,  7 Dec 2011 15:42:12 +0100
Message-Id: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/3] u-boot 2011.09: add pandaboard support
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
X-List-Received-Date: Wed, 07 Dec 2011 14:42:22 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-bsp/u-boot/u-boot_2011.09.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-boot_2011.09.bb
index 74c8518..955bd5e 100644
--- a/recipes-bsp/u-boot/u-boot_2011.09.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
@@ -8,9 +8,9 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 # No patches for other machines yet
-COMPATIBLE_MACHINE = "(beagleboard)"
+COMPATIBLE_MACHINE = "(beagleboard|omap4430-panda)"
 
-SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
+SRC_URI_pn-${PN}_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://2011.09/0001-omap3-mem-Comment-enable_gpmc_cs_config-more.patch \
            file://2011.09/0002-OMAP3-Update-SDRC-dram_init-to-always-call-make_cs1_.patch \
            file://2011.09/0003-OMAP3-Add-a-helper-function-to-set-timings-in-SDRC.patch \
@@ -35,7 +35,10 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://fw_env.config \
           "
 
-SRCREV = "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
+SRCREV_pn-${PN}_beagleboard = "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
+
+SRC_URI_pn-${PN}_omap4430-panda = "git://git.linaro.org/boot/u-boot-linaro-stable.git"
+SRCREV_pn-${PN}_omap4430-panda = "3d343a62b8240100d6ce76b9126ff1e97be1eb5f"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
-- 
1.7.2.5


