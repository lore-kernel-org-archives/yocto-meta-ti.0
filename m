Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8CBFE0049B
	for <meta-ti@yoctoproject.org>; Thu,  4 Oct 2012 21:39:12 -0700 (PDT)
Received: by mail-oa0-f48.google.com with SMTP id h2so1729453oag.35
	for <meta-ti@yoctoproject.org>; Thu, 04 Oct 2012 21:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Z1+rbuthpqhADGUgZ0g4MLSV0yb/+ZYYRmVWhB+EOhE=;
	b=thky1kgq2vj1pulFExHMusegjXviMvOZUZmt6qRmnPNMym3vTXKCDlvL7xdGahcvCo
	kQkfmwXEHXiDADW9F9FMsSwbIXii3uWZE1P9jf8kv4Bc4wXcYnaYXkcWpu42Ub3W9rnW
	z7477mT5CmTAZgps/ExM6b/58KetBVBk/lguE/OCSRwxkxeqDRAxuTtb1mIOVVmA1j4a
	+3vX+Rbel/ztj1k/2Xjn+bqHk9CSrzu6TwR2VE8pWOZpUaRp5b8rsEH/b46nQ/magw5V
	SXBc1ppsXPnGx//Xr7lin12SmLlDNiV0yVnzM1kVDRJ9bXUODYeUR193I29s4u2AuHLA
	7o6Q==
Received: by 10.60.22.196 with SMTP id g4mr6290985oef.95.1349411950107;
	Thu, 04 Oct 2012 21:39:10 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a6sm6676265oeh.1.2012.10.04.21.39.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 21:39:09 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri,  5 Oct 2012 00:07:28 -0500
Message-Id: <1349413648-14346-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] u-boot_2011.09-psp04.06.00.08: Add PSP v04.06.00.08 of u-boot
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 04:39:13 -0000

* Add the PSP release version 04.06.00.08 of u-boot.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update COMPATIBLE_MACHINE to use generic omap3 instead of being board specific.

 .../u-boot/u-boot_2011.09-psp04.06.00.08.bb        |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb

diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
new file mode 100644
index 0000000..1bd4b9e
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
@@ -0,0 +1,29 @@
+# Use the version of u-boot.inc in oe-core not the meta-ti version
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+COMPATIBLE_MACHINE = "ti33x|omap3"
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "AM335XPSP_04.06.00.08"
+
+# Lock to the commit corresponding to TAG:
+# v2011.09_AM335xPSP_04.06.00.08
+SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "img"
+
+# Set the name of the SPL that will built so that it is also packaged with u-boot.
+SPL_BINARY = "MLO"
-- 
1.7.0.4


