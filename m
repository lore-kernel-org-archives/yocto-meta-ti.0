Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 254D0E00312
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 20:21:24 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIT008XT839C714@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 25 Feb 2013 22:21:10 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C86D8200BD; Mon,
	25 Feb 2013 23:21:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Feb 2013 23:21:08 -0500
Message-id: <1361852468-4352-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] u-boot: add latest mainline release 2013.01.01
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
X-List-Received-Date: Tue, 26 Feb 2013 04:21:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Should work reasonable well for most platforms and is provided as an alternative.
Is not enabled by default, since there are usually older versions with more
features supported.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2013.01.01.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-bsp/u-boot/u-boot_2013.01.01.bb

diff --git a/recipes-bsp/u-boot/u-boot_2013.01.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
new file mode 100644
index 0000000..4c460cc
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
@@ -0,0 +1,22 @@
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+DESCRIPTION = "Mainline u-boot bootloader"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r1"
+
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "u-boot-2013.01.y"
+
+SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "img"
+SPL_BINARY = "MLO"
-- 
1.8.1.2


