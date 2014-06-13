Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB570E00BEA; Fri, 13 Jun 2014 14:56:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8542EE00AFD
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 14:56:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DLu0Lq026928
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 16:56:00 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DLu0Ut032224
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 16:56:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 16:56:00 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s5DLtvbO018171;	Fri, 13 Jun 2014 16:55:58 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Jun 2014 16:55:54 -0500
Message-ID: <1402696555-21792-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] u-boot: Add mainline u-boot version 2014.07-rc3
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
X-List-Received-Date: Fri, 13 Jun 2014 21:56:13 -0000
Content-Type: text/plain

* The latest mainline u-boot works well for most TI devices and
  we want to enable more people to use and test it.  Adding
  version 2014.07-rc3 will allow more people to build and use this
  u-boot version
* Add a dependency on dtc-native since the latest mainline of u-boot
  now requires this and not every build host will have the right
  version.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-bsp/u-boot/u-boot_2014.07.bb |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-bsp/u-boot/u-boot_2014.07.bb

diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
new file mode 100644
index 0000000..b326aa1
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
@@ -0,0 +1,27 @@
+require u-boot-ti.inc
+
+# DEPEND on dtc-native for mainline u-boot because the mainline u-boot depends
+# on some of the latest syntax constructs for an appended in dtb used for
+# items like secure boot/image signing.
+DEPENDS += "dtc-native"
+
+DESCRIPTION = "Mainline u-boot bootloader"
+
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
+
+# This is still an RC so set the PV accordingly to allow proper version
+# ordering when the RC is dropped.
+PV = "2014.04+2014.07-rc3"
+PR = "r0"
+
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "master"
+
+# Corresponds to tag v2014.07-rc3
+SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
+
+SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.7.9.5


