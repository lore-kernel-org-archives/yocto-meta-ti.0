Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8400E00C45; Wed,  6 Feb 2019 16:42:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89C6CE00C1E
	for <meta-ti@yoctoproject.org>; Wed,  6 Feb 2019 16:42:46 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B2CE940B53;
	Thu,  7 Feb 2019 00:42:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZXSyn5RzOy3c; Thu,  7 Feb 2019 00:42:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 94EB140AD5;
	Thu,  7 Feb 2019 00:42:44 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A29E516A90C;
	Wed,  6 Feb 2019 19:42:43 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Feb 2019 19:42:42 -0500
Message-Id: <1549500162-52879-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] u-boot-ti-staging: update to 2019.01
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
X-List-Received-Date: Thu, 07 Feb 2019 00:42:47 -0000

License checksum changed due to extra SPDX lines - no actual license change.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../files/0001-Always-build-with-fno-PIE.patch     | 35 ----------------------
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb    |  9 ------
 recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb    |  7 +++++
 recipes-bsp/u-boot/u-boot-ti.inc                   |  4 +--
 4 files changed, 9 insertions(+), 46 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb

diff --git a/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
deleted file mode 100644
index dfd99c6..0000000
--- a/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ec81bbe3ea7e077512f4b9d2b4aa87e7f1494bcc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 Oct 2018 22:32:57 -0700
-Subject: [PATCH] Always build with -fno-PIE
-
-GNU Toolchains can be configured to generate PIE by default
-while PIE could be ok, it is known that u-boot/SPL on ARM starts to
-generate bigger code and starts to overflow the SRAM size, therefore
-disabling PIE explcitly insulates against toolchain intrinsic defaults
-
-Fixes errors like
-| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
-| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Tom Rini <trini@konsulko.com>
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index 45cd751ba3..9eb8ac564e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -592,6 +592,7 @@ KBUILD_CFLAGS	+= -O2
- endif
- 
- KBUILD_CFLAGS += $(call cc-option,-fno-stack-protector)
-+KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
- KBUILD_CFLAGS += $(call cc-option,-fno-delete-null-pointer-checks)
- 
- KBUILD_CFLAGS	+= -g
--- 
-2.19.1
-
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
deleted file mode 100644
index d458dc9..0000000
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require u-boot-ti.inc
-
-PR = "r30"
-
-BRANCH = "ti-u-boot-2018.01"
-
-SRCREV = "313dcd69c2b32648266f91bcf223f9e539bc4201"
-
-SRC_URI += "file://0001-Always-build-with-fno-PIE.patch"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
new file mode 100644
index 0000000..a890b82
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
@@ -0,0 +1,7 @@
+require u-boot-ti.inc
+
+PR = "r0"
+
+BRANCH = "ti-u-boot-2019.01"
+
+SRCREV = "721a0ba045e97f4532718d38ed6941eb9a167225"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 62f04f7..9d82711 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -20,7 +20,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
 SUMMARY = "u-boot bootloader for TI devices"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 
 BRANCH ?= "master"
 UBOOT_GIT_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git"
@@ -30,7 +30,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 PV_append = "+git${SRCPV}"
 
 # u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native bc-native lzop-native"
+DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
 
 PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/boot/bl31.bin,,arm-trusted-firmware"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
-- 
2.7.4


