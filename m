Return-Path: <tom.rini@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A847E013E3
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:52 -0700 (PDT)
Received: by mail-gy0-f176.google.com with SMTP id z10so1247338ghb.35
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 11:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=VmNs9CkPk79qWBpdlGHSBYPVGDO/3trud+VV5SBIKkE=;
	b=OihmNMmQ6JiMVX3ZAyHqdMlc3awuOO806+XaopCnleHC+UJI92oVSXIqv8r2OJP/sz
	DwKr/KCC46wpAjCLJL0D5flVOhAwzKHesgzodOXo4wz1R/CQQq1ZfEjYgeDxl2tMipsx
	+O1l9yooSh0WKfptdoMyiYZL0wSFeuaaEIQCOG3w2Zj8qZ4BFevV2JAm14Xg3R2GKeIH
	t/h1dE49xgAtsL67p1GD890mkWMqFgkUljXNkZbaM1ZHtk+IEjxPeVHqjEad37o1IaI8
	zRk4fGkqFEpH0lBuq4GEKGAAvAfVwBrIgAgQlLXCaWCCGRPHHwktZWGy/lfXebBIyYQD
	2XIQ==
Received: by 10.60.13.196 with SMTP id j4mr39599097oec.14.1332958492092;
	Wed, 28 Mar 2012 11:14:52 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id h5sm2962774oea.1.2012.03.28.11.14.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 11:14:51 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Mar 2012 11:14:39 -0700
Message-Id: <1332958485-967-4-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1332524217-27534-1-git-send-email-trini@ti.com>
References: <1332524217-27534-1-git-send-email-trini@ti.com>
Subject: [PATCH v3 04/10] am335x-evm.conf: Add 'ubi' to IMAGE_FSTYPES, use '=+' in assignment
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
X-List-Received-Date: Wed, 28 Mar 2012 18:14:52 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '=+' to set IMAGE_FSTYPES.  We also add
the required MKUBIFS_ARGS / UBINIZE_ARGS.  These are placed next to the
line that sets us to use the PSP kernel tree and reference the TI wiki
for the source of our info as well as dmesg / userland commands.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/am335x-evm.conf |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index eedf072..2e286a3 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -12,12 +12,33 @@ GUI_MACHINE_CLASS = "smallscreen"
 
 require conf/machine/include/ti33x.inc
 
-IMAGE_FSTYPES ?= "tar.bz2"
+IMAGE_FSTYPES =+ "ubi tar.bz2"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 
+# UBI information.  Note that this is board and kernel specific.  Changes
+# in your kernel port may require changes in these variables.  For more
+# details about this board please see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1988 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 1988"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 UBOOT_ARCH = "arm"
-- 
1.7.0.4


