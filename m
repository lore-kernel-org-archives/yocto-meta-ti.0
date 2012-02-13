Return-Path: <tom.rini@gmail.com>
Received: from mail-pz0-f53.google.com (mail-pz0-f53.google.com
	[209.85.210.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 904A8E011D1
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 08:51:28 -0800 (PST)
Received: by dady25 with SMTP id y25so5429996dad.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=5TQ18n5/O/QLA+laZoGGgjUMo5wPKospjeANUl85dK4=;
	b=QYkpwFd8uWBxDkRgROrz1UwqoPViEqlLPCz+Gz/8tHhJ30yiR73t0qqCDVZ/F+ej4d
	todwmq6mlCVEpb98pKrVnqhH4zp7UeI/oWwvfXmZXtQtCn2/R5rQWKAPZU1/75lZmvBy
	QkS5st5dBX8Xhzs7mN9ol/08czmSXIUgTfeBI=
Received: by 10.68.141.232 with SMTP id rr8mr14120213pbb.29.1329151888122;
	Mon, 13 Feb 2012 08:51:28 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id p2sm40953852pbb.14.2012.02.13.08.51.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 08:51:27 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 09:51:27 -0700
Message-Id: <1329151888-7525-2-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1329151888-7525-1-git-send-email-trini@ti.com>
References: <1329151888-7525-1-git-send-email-trini@ti.com>
Subject: [PATCH 2/3] u-boot 2011.12: Add fw_env.config for beagleboard
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
X-List-Received-Date: Mon, 13 Feb 2012 16:51:28 -0000

beagleboard provides a correct fw_env.config file so add to the SRC_URI
and RRECOMMENDS on u-boot-fw-utils.

Signed-off-by: Tom Rini <trini@ti.com>
---
 recipes-bsp/u-boot/u-boot_2011.12.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 3610837..4024e64 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,7 +6,7 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r4"
+PR = "r5"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
@@ -15,6 +15,11 @@ COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|oma
 CACHEFIX = "file://2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch"
 CACHEFIX_omap4 = ""
 
+# File is board-specific, only copy when it will be correct.
+FWENV_beagleboard = "file://fw_env.config"
+FWENV = ""
+RRECOMMENDS_beagleboard = "u-boot-fw-utils"
+
 SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch \
            file://2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch \
@@ -26,6 +31,7 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            ${CACHEFIX} \
            file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
            file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
+           ${FWENV} \
           "
 
 
-- 
1.7.0.4


