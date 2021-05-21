Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7310.1621593037668028434
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 May 2021 03:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MVSpwE/S;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14LAUaht032920;
	Fri, 21 May 2021 05:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621593036;
	bh=/jZQx3b5Glsi+4zuknEDwQIsqSH6+CYri6ZB8jn5Xs4=;
	h=From:To:CC:Subject:Date;
	b=MVSpwE/SFOrHJQ0Wij+r0XclAfHXvDwlhuVMY/ncWzyxfGhuItIHhGP0+vU8tgRH2
	 4Lmk08PRRsMac48OClE//8lXgIMCwvIaO2xZDXIBapU87KWng9dkx0xqHLoNxbfLES
	 gLA05Iv+9HrkUu/GrQm0n0bZIgxdX8sDLy1LWTuk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14LAUaiO092701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 May 2021 05:30:36 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 05:30:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 05:30:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14LAUZMR052830;
	Fri, 21 May 2021 05:30:35 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Nishant Menon <nm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][Patch] linux-ti-staging:Added DTC_FLAGS to extra kernel arguments
Date: Fri, 21 May 2021 05:30:35 -0500
Message-ID: <20210521103035.7666-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Added DTC_FLAGS (-@) to individual MACHINE conf to compile dtbs
with symbols. This fixes the issue where the dtbs are build without
symbols causing issue with overlays.

The DTC_FLAGS can be overriden by initializing it in local.conf

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/am335x-evm.conf                  | 3 +++
 conf/machine/am335x-hs-evm.conf               | 3 +++
 conf/machine/am437x-evm.conf                  | 3 +++
 conf/machine/am437x-hs-evm.conf               | 3 +++
 conf/machine/am57xx-evm.conf                  | 3 +++
 conf/machine/am57xx-hs-evm.conf               | 4 ++++
 conf/machine/am65xx-evm.conf                  | 3 +++
 conf/machine/am65xx-hs-evm.conf               | 3 +++
 conf/machine/dra7xx-evm.conf                  | 3 +++
 conf/machine/dra7xx-hs-evm.conf               | 4 ++++
 conf/machine/j7-evm.conf                      | 3 +++
 conf/machine/j7-hs-evm.conf                   | 3 +++
 conf/machine/j7200-evm.conf                   | 3 +++
 conf/machine/k2g-evm.conf                     | 3 +++
 conf/machine/k2g-hs-evm.conf                  | 3 +++
 recipes-kernel/linux/linux-ti-mainline_git.bb | 5 +++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 5 +++--
 17 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 469c4d37..f90d2c1b 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -13,6 +13,9 @@ IMAGE_FSTYPES += "ubifs ubi"
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/am335x-hs-evm.conf b/conf/machine/am335x-hs-evm.conf
index 7caa5bfd..5378524a 100644
--- a/conf/machine/am335x-hs-evm.conf
+++ b/conf/machine/am335x-hs-evm.conf
@@ -16,3 +16,6 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am3x"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 4e3681d5..2756f87f 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -11,6 +11,9 @@ IMAGE_FSTYPES += "ubifs ubi"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
index 0a8ca06d..32a3616a 100644
--- a/conf/machine/am437x-hs-evm.conf
+++ b/conf/machine/am437x-hs-evm.conf
@@ -16,3 +16,6 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
 OPTEEMACHINE = "ti-am43xx"
 OPTEEFLAVOR = "am43xx"
 OPTEEOUTPUTMACHINE = "ti"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 78e730ca..f4659774 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -24,6 +24,9 @@ KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am5
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index d4f6e098..d17c440e 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -17,3 +17,7 @@ OPTEEMACHINE = "ti-am57xx"
 OPTEEFLAVOR = "am57xx"
 OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
+
diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 8b6ef546..99ad4e94 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -5,3 +5,6 @@
 require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index e4eebb6a..83d36e2d 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -20,3 +20,6 @@ UBOOT_BINARY = "u-boot.img_HS"
 IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index ad4b0263..4c699769 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -18,6 +18,9 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "dra7xx_evm_config"
 
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index da4000f2..9dfe0212 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -17,3 +17,7 @@ OPTEEMACHINE = "ti-dra7xx"
 OPTEEFLAVOR = "dra7xx"
 OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
+
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 1b99baeb..1c815f5f 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -14,3 +14,6 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index 70e14754..5e7b18ab 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -20,3 +20,6 @@ UBOOT_BINARY = "u-boot.img_HS"
 IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index 2565c90c..5a2c90ed 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -16,5 +16,8 @@ UBOOT_MACHINE = "j7200_evm_a72_config"
 # J7200 supports multi-certificate images, use the same
 IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
 
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
+
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index d4cf0605..fd0c231e 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -19,6 +19,9 @@ SERIAL_CONSOLES = "115200;ttyS0"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
+
 # do ubiattach /dev/ubi_ctrl -m 4
 # From dmesg:
 # UBI: smallest flash I/O unit:    4096
diff --git a/conf/machine/k2g-hs-evm.conf b/conf/machine/k2g-hs-evm.conf
index 0620b1f5..1ef4f28f 100644
--- a/conf/machine/k2g-hs-evm.conf
+++ b/conf/machine/k2g-hs-evm.conf
@@ -13,3 +13,6 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2g"
+
+#Add DTC_FLAGS to compile DTB with symbols.
+EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index fc16485d..79aef995 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -11,7 +11,8 @@ require recipes-kernel/linux/kernel-rdepends.inc
 
 DEPENDS += "gmp-native"
 
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_FLAGS}"
 
 S = "${WORKDIR}/git"
 
@@ -23,7 +24,7 @@ SRCREV = "9f4ad9e425a1d3b6a34617b8ea226d56a119a717"
 PV = "5.12+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 4ec19af7..0de7208c 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -15,7 +15,8 @@ require recipes-kernel/linux/kernel-rdepends.inc
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
+		      ${EXTRA_DTC_FLAGS}"
 
 S = "${WORKDIR}/git"
 
@@ -25,7 +26,7 @@ SRCREV = "d85aee3e19aa7403bd157d2ae30917e736096a7f"
 PV = "5.10.30+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
2.17.1

